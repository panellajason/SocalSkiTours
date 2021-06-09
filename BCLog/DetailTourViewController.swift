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

class DetailTourViewController: UIViewController, UIScrollViewDelegate {
    
    var passedTour: Tour!
    var tourToPass: Tour!
    var isFavorite: Bool = false
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var userID = UserService.currentUserProfile?.userID

    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detailDescription: UILabel!
    @IBOutlet var detailAspect: UILabel!
    @IBOutlet var detailElevation: UILabel!
    @IBOutlet var detailTrailHead: UILabel!
    @IBOutlet var favoritesButton: UIBarButtonItem!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var topScrollView: UIScrollView!
    

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //query data for one tour to apply correct star image
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
                self.removeSpinner()
        }
        
        pageControl.numberOfPages = passedTour.tourImages.count
        pageControl.currentPage = 0
        topScrollView.delegate = self
        topScrollView.frame = view.frame
        for i in 0..<passedTour.tourImages.count {
            
            let imageView = UIImageView()
            imageView.image = passedTour.tourImages[i]
            imageView.contentMode = .scaleToFill
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: self.topScrollView.frame.width, height: 300)
            topScrollView.contentSize.width = topScrollView.frame.width * CGFloat(i + 1)

            topScrollView.addSubview(imageView)
        }
        
        detailTitle.text = passedTour.tourTitle
        detailDescription.text = passedTour.tourDescription
        detailAspect.text = "Aspect: " + passedTour.tourAspect + " // Slope Angle: " + passedTour.tourAngle + " degrees"
        detailElevation.text = "Base: " + passedTour.tourBase + " // Summit: " + passedTour.tourSummitElevation
        detailTrailHead.text = passedTour.tourTrailhead + " // Approach: " + passedTour.tourDistance
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //query data for one tour to apply correct star image
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
                self.removeSpinner()
        }
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
        self.showSpinner(onView: self.view)

        if !isFavorite {
            //add to favorites
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

        } else {
            //remove from favorites
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
                                    print("Document successfully removed!")
                                }
                            }

                            self.isFavorite = false
                            self.favoritesButton.image = UIImage(systemName: "star")

                        }
                    }
            }
        }
        
        self.removeSpinner()
    }
    
    
    @IBAction func goToMapView(_ sender: Any) {
        self.tourToPass = passedTour
        self.performSegue(withIdentifier: "toDetailMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        if (segue.identifier == "toDetailMap") {
            
            let viewController = segue.destination as! DetailMapViewController
       
            viewController.passedTour = tourToPass
        }
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
       
    }
}
