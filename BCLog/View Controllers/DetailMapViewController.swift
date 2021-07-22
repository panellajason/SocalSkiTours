//
//  DetailMapViewController.swift
//  BCLog
//
//  Created by Jason Panella on 6/1/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import GoogleMaps


class DetailMapViewController: UIViewController, GMSMapViewDelegate {

    var passedTour: Tour!
    var mapView: GMSMapView!
    var isSatelliteView = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = passedTour.tourTitle.uppercased()
        
        //Setup for the passed Tour's MapView
        let location = passedTour.tourID.split(separator: " ").map{ String($0) }
        let lat = (location[0] as NSString).doubleValue
        let long = (location[1] as NSString).doubleValue
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 14.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.delegate = self
        mapView.mapType = .terrain
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        view.addSubview(mapView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addTourToMap()
    }
    
    @IBAction func showOrHideSatelliteView(_ sender: Any) {
        if(isSatelliteView) {
            mapView.mapType = .terrain
            isSatelliteView = false
        } else {
            mapView.mapType = .satellite
            isSatelliteView = true
        }
    }
    
    func addTourToMap() {
        //Tour Marker
        passedTour.tourMarker.title = passedTour.tourMarker.snippet
        passedTour.tourMarker.snippet = passedTour.tourSummitElevation
        passedTour.tourMarker.map = mapView
        //Tour Path
        passedTour.tourPath.map = mapView
        //Tour Trailhead
        passedTour.tourTrailhead.snippet = passedTour.tourBaseElevation
        passedTour.tourTrailhead.map = mapView

    }

}
