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
    private var mapView: GMSMapView!
    private lazy var isSatelliteView = false
    private var button: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addTourToMap()
    }
    
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
        if (UIScreen.main.bounds.width > 375.0) {
            mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 173, right: 0)
            button = UIButton(frame: CGRect(x:UIScreen.main.bounds.width-62, y:UIScreen.main.bounds.height-298, width: 50, height: 50))
            button.layer.cornerRadius = 25
        } else {
            mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 114, right: 0)
            button = UIButton(frame: CGRect(x:UIScreen.main.bounds.width-62, y:UIScreen.main.bounds.height-234, width: 46, height: 46))
            button.layer.cornerRadius = 23
        }
        view.addSubview(mapView)
        
        button.setImage(UIImage(systemName: "square.stack.3d.up"), for: .normal)
        button.backgroundColor = UIColor.clear
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.borderWidth = 0.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(showOrHideSatelliteView), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @IBAction func showOrHideSatelliteView(_ sender: Any) {
        
        if(isSatelliteView) {
            button.setImage(UIImage(systemName: "square.stack.3d.up"), for: .normal)
            mapView.mapType = .terrain
            isSatelliteView = false
        } else {
            button.setImage(UIImage(systemName: "square.stack.3d.up.fill"), for: .normal)
            mapView.mapType = .satellite
            isSatelliteView = true
        }
    }
    
    private func addTourToMap() {
        
        //Tour Marker
        let tempMarker = GMSMarker()
        tempMarker.title = passedTour.tourMarker.snippet
        tempMarker.snippet = passedTour.tourSummitElevation
        tempMarker.position = passedTour.tourMarker.position
        tempMarker.icon = GMSMarker.markerImage(with: .blue)
        tempMarker.map = mapView
        //Tour Path
        passedTour.tourPath.map = mapView
        //Tour Trailhead
        let tempTH = GMSMarker()
        tempTH.title = passedTour.tourTrailhead.title
        tempTH.snippet = passedTour.tourBaseElevation
        tempTH.position = passedTour.tourTrailhead.position
        tempTH.icon = GMSMarker.markerImage(with: .black)
        tempTH.map = mapView
    }
}
