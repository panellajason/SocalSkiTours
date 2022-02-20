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

    private var tourToPass: Tour!
    private var passedTour: Tour!
    private lazy var isSatelliteView = false
    private var mapView: GMSMapView!
    private var button: UIButton!


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addToursToMap()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //MapView setup
        let camera = GMSCameraPosition.camera(withLatitude: 34.070986, longitude: -117.326830, zoom: 8.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.delegate = self
        mapView.mapType = .terrain
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        if (UIScreen.main.bounds.width > 375.0) {
            mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 85, right: 0)
            button = UIButton(frame: CGRect(x:UIScreen.main.bounds.width-62, y:UIScreen.main.bounds.height-210, width: 50, height: 50))
            button.layer.cornerRadius = 25
        } else {
            mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
            button = UIButton(frame: CGRect(x:UIScreen.main.bounds.width-61, y:UIScreen.main.bounds.height-170, width: 46, height: 46))
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
    
    @objc func showOrHideSatelliteView() {
        if isSatelliteView {
            button.setImage(UIImage(systemName: "square.stack.3d.up"), for: .normal)
            mapView.mapType = .terrain
            isSatelliteView = false
        } else {
            button.setImage(UIImage(systemName: "square.stack.3d.up.fill"), for: .normal)
            mapView.mapType = .satellite
            isSatelliteView = true
        }
    }
    
    private func addToursToMap() {
        
        for tour in TourService.allTours {
            
            tour.tourTrailhead.map = mapView
            tour.tourPath.map = mapView
            tour.tourMarker.map = mapView
        }
    }
        
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
                
        if marker.snippet == nil {
            //do nothing for now
        } else {
            let id = marker.position.latitude.description + " " +  marker.position.longitude.description
            
            TourService.findTour(withId: id) { [weak self] tour in
                
                self?.tourToPass = tour
                self?.performSegue(withIdentifier: "toDetailTour2", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour2") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
