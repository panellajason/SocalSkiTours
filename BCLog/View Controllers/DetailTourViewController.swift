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

    @IBOutlet weak var firstLine: UILabel!
    @IBOutlet weak var secondLine: UILabel!
    @IBOutlet weak var thirdLine: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var diffcultyBTN1: UIImageView!
    @IBOutlet weak var diffcultyBTN2: UIImageView!
    @IBOutlet weak var diffcultyBTN3: UIImageView!
    @IBOutlet weak var favoritesButton: UIBarButtonItem!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var topScrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DatabaseService.checkIfTourIsFavorite(tourID: passedTour.tourID) { [weak self] error, isFavorite in
            
            guard error == nil else { return }
            
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
        
        let errorAlert = UIAlertController(title: "Error", message: "Unable to add to favorites.", preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        if !isFavorite {
            
            DatabaseService.addToFavorites(tourID: passedTour.tourID) { [weak self] error in
                
                guard error == nil else {
                    self?.present(errorAlert, animated: true)
                    return
                }
                
                self?.isFavorite = true
                self?.favoritesButton.image = UIImage(systemName: "star.fill")
            }
            
        } else {
            
            DatabaseService.removeFromFavorites(tourID: passedTour.tourID) { [weak self] error in
                
                guard error == nil else {
                    errorAlert.message = "Unable to remove from favorites."
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
        present(webViewController, animated: false, completion: nil)
    }
    
    private func setUpUI() {
        
        if (UIScreen.main.bounds.width <= 395.0) {
            sizeLabels(sizeOfFont: 15)
        } else {
            sizeLabels(sizeOfFont: 16)
        }
        
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
    
    private func sizeLabels(sizeOfFont: CGFloat) {
        
        let approach: String = String(format: "%.1f", passedTour.tourDistance)
        let miles = (passedTour.tourDistance == 1.0) ? " mile" : " miles"
        firstLine.text = passedTour.tourTrailhead.title! + " // Approach: " + approach + miles
        firstLine.font = firstLine.font.withSize(sizeOfFont)
        
        secondLine.text = "Base: " + passedTour.tourBaseElevation + " // Summit: " + passedTour.tourSummitElevation
        secondLine.font = secondLine.font.withSize(sizeOfFont)
        
        thirdLine.text = "Aspect: " + passedTour.tourAspect + " // Slope Angle: " + passedTour.tourAngle + " degrees"
        thirdLine.font = thirdLine.font.withSize(sizeOfFont)
        
        detailDescription.font = detailDescription.font.withSize(sizeOfFont + 1)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: sizeOfFont)]
        let attributedString = NSMutableAttributedString(string:"Other info: ", attributes:attrs)
        attributedString.append(NSMutableAttributedString(string: passedTour.tourDescription))
        detailDescription.attributedText = attributedString
        
        switch passedTour.tourDifficulty {
            case 3:
                difficultyLabel.text = " Most Difficult"
                diffcultyBTN3.image = UIImage(systemName: "star.fill")
                diffcultyBTN2.image = UIImage(systemName: "star.fill")
            case 2:
                difficultyLabel.text = " Intermediate"
                diffcultyBTN2.image = UIImage(systemName: "star.fill")
            case 1:
                difficultyLabel.text = " Least Difficult"
            default:
                break
        }
        difficultyLabel.font = difficultyLabel.font.withSize(sizeOfFont - 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailMap") {
            let viewController = segue.destination as! DetailMapViewController
            viewController.passedTour = tourToPass
        }
    }
}
