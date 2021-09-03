//
//  DetailTourViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/17/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import SafariServices
import EEZoomableImageView

class DetailTourViewController: UIViewController, UIScrollViewDelegate {
    
    var passedTour: Tour!
    private var tourToPass: Tour!
    private lazy var isFavorite: Bool = false

    @IBOutlet var detailDescription: UILabel!
    @IBOutlet var detailAspect: UILabel!
    @IBOutlet var detailElevation: UILabel!
    @IBOutlet var detailTrailHead: UILabel!
    @IBOutlet var favoritesButton: UIBarButtonItem!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var topScrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DatabaseService.checkIfTourIsFavorite(tourID: passedTour.tourID) { [weak self] error, isFavorite in
            
            guard error == nil else {
                return
            }
            
            if isFavorite {
                self?.favoritesButton.image = UIImage(systemName: "star.fill")
                self?.isFavorite = true
            } else {
                self?.isFavorite = false
                self?.favoritesButton.image = UIImage(systemName: "star")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = passedTour.tourTitle.uppercased()
        
        setUpUI()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //Determine current page by calculating x posistion of scrollview
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    @IBAction func addOrRemoveFavorite(_ sender: Any) {
        self.showSpinner(onView: self.view)
        
        if !isFavorite {
            
            DatabaseService.addToFavorites(tourID: passedTour.tourID) { [weak self] error in
                
                guard error == nil else {
                    let errorAlert = UIAlertController(title: "Error", message: "Unable to add to favorites.", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self?.present(errorAlert, animated: true)
                    return
                }
                
                self?.isFavorite = true
                self?.favoritesButton.image = UIImage(systemName: "star.fill")
            }
            
        } else {
            
            DatabaseService.removeFromFavorites(tourID: passedTour.tourID) { [weak self] error in
                
                guard error == nil else {
                    let errorAlert = UIAlertController(title: "Error", message: "Unable to remove from favorites.", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self?.present(errorAlert, animated: true)
                    return
                }
                
                self?.isFavorite = false
                self?.favoritesButton.image = UIImage(systemName: "star")
            }
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
    
    private func setUpUI() {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailMap") {
            let viewController = segue.destination as! DetailMapViewController
            viewController.passedTour = tourToPass
        }
    }
}
