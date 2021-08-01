//
//  DetailTourViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/17/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
import SafariServices
import EEZoomableImageView

class DetailTourViewController: UIViewController, UIScrollViewDelegate {
    
    var passedTour: Tour!
    var tourToPass: Tour!
    var isFavorite: Bool = false
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var userID = UserService.currentUserProfile?.userID

    @IBOutlet var detailDescription: UILabel!
    @IBOutlet var detailAspect: UILabel!
    @IBOutlet var detailElevation: UILabel!
    @IBOutlet var detailTrailHead: UILabel!
    @IBOutlet var favoritesButton: UIBarButtonItem!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var topScrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkForFavorites()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = passedTour.tourTitle.uppercased()
        
        //Add the passed Tour's details to textviews
        detailDescription.text = passedTour.tourDescription
        detailAspect.text = "Aspect: " + passedTour.tourAspect + " // Slope Angle: " + passedTour.tourAngle + " degrees"
        detailElevation.text = "Base: " + passedTour.tourBaseElevation + " // Summit: " + passedTour.tourSummitElevation
        detailTrailHead.text = passedTour.tourTrailhead.title! + " // Approach: " + passedTour.tourDistance
        
        //Add the passed Tour's images to horizontal scrollview
        pageControl.numberOfPages = passedTour.tourImages.count
        pageControl.currentPage = 0
        topScrollView.delegate = self
        topScrollView.frame = view.frame
        for i in 0..<passedTour.tourImages.count {
            let imageView = EEZoomableImageView()
            imageView.image = passedTour.tourImages[i]
            imageView.contentMode = .scaleToFill
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: self.topScrollView.frame.width, height: 300)
            topScrollView.contentSize.width = topScrollView.frame.width * CGFloat(i + 1)
            topScrollView.addSubview(imageView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Determine current page by calculating x posistion of scrollview
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    @IBAction func addOrRemoveFavorite(_ sender: Any) {
        self.showSpinner(onView: self.view)
        if !isFavorite {
            addToFavorites()
        } else {
            removeFromFavorites()
        }
        self.removeSpinner()
    }
    
    @IBAction func goToMapView(_ sender: Any) {
        self.tourToPass = passedTour
        self.performSegue(withIdentifier: "toDetailMap", sender: self)
    }
        
    @IBAction func goToWeather(_ sender: Any) {
        let location = passedTour.tourID.split(separator: " ").map{ String($0) }
        let lat = location[0]
        let lon = location[1]
        let url = "https://forecast.weather.gov/MapClick.php?lat="+lat+"&lon="+lon+"#.YPeKJhNKjeo"
        let webViewController = SFSafariViewController(url: URL(string: url)!)
        present(webViewController, animated: true, completion: nil)
    }
    
    func checkForFavorites() {
        //Query data for one tour to apply correct star image
        db.collection("user_favorites").whereField("tour_id", isEqualTo: passedTour.tourID).whereField("user_id", isEqualTo: userID as Any)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if !querySnapshot!.documents.isEmpty {
                        self.favoritesButton.image = UIImage(systemName: "star.fill")
                        self.isFavorite = true
                    }
                    else {
                        self.favoritesButton.image = UIImage(systemName: "star")
                        self.isFavorite = false
                    }
                }
        }
    }
    
    func addToFavorites() {
        ref = db.collection("user_favorites").addDocument(data: [
            "tour_id": passedTour.tourID,
            "user_id": userID as Any
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.isFavorite = true
                self.favoritesButton.image = UIImage(systemName: "star.fill")
            }
        }
    }
    
    func removeFromFavorites() {
        db.collection("user_favorites").whereField("tour_id", isEqualTo: passedTour.tourID).whereField("user_id", isEqualTo: userID as Any)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if !querySnapshot!.documents.isEmpty {
                        
                        self.db.collection("user_favorites").document(querySnapshot!.documents[0].documentID).delete() { err in
                            if let err = err {
                                print("Error removing document: \(err)")
                            } else {
                            }
                        }
                        self.isFavorite = false
                        self.favoritesButton.image = UIImage(systemName: "star")
                    }
                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailMap") {
            let viewController = segue.destination as! DetailMapViewController
            viewController.passedTour = tourToPass
        }
    }
}
