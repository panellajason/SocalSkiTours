//
//  MapViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/16/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {

    var tourToPass: Tour!
    var passedTour: Tour!
    var isSatelliteView = false
    var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "alltours")
        navigationItem.titleView = imageView
            
        // Generic MapView setup
        let camera = GMSCameraPosition.camera(withLatitude: 34.070986, longitude: -117.326830, zoom: 8.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.delegate = self
        mapView.mapType = .terrain
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        view.addSubview(mapView)
        
        
        //------------------------------------
        //click on photo for zoom
        //welcome page
        //about/disclosures
        //forgot password
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addToursToMap()
    }
    
    func addToursToMap() {
        for tour in TourService.allTours {
            tour.tourTrailhead.map = mapView
            tour.tourMarker.map = mapView
            tour.tourPath.map = mapView
        }
    }
        
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        if marker.title == "South Fork Trailhead" || marker.title == "Sugarloaf Trailhead" || marker.title == "Mt Baldy Trailhead" || marker.title == "Vincent Gap Trailhead" || marker.title == "Krakta Ridge Trailhead" || marker.title == "Mt Waterman Trailhead" || marker.title == "Palm Springs Tramway" || marker.title == "Snow Creek Trailhead" || marker.title == "Mt Baldy Resort"   {
            
        }
        else {
            let id = marker.position.latitude.description + " " +  marker.position.longitude.description
    
            TourService.findTour(withId: id) { tour in
                self.tourToPass = tour
                self.performSegue(withIdentifier: "toDetailTour2", sender: self)
            }
        }
    }
    
    @IBAction func showOrHideSatelliteView(_ sender: Any) {
        if isSatelliteView {
            mapView.mapType = .terrain
            isSatelliteView = false
        } else {
            mapView.mapType = .satellite
            isSatelliteView = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour2") {
            
            let viewController = segue.destination as! DetailTourViewController
       
            viewController.passedTour = tourToPass
        }
    }

}
