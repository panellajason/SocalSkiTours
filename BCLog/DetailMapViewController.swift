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
        self.title = passedTour.tourTitle
        
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
        
        //Tour Marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = passedTour.tourTitle
        marker.map = mapView
        
        //Tour Path
        let line = GMSPolyline(path: passedTour.tourPath)
        line.strokeWidth = 3
        line.map = mapView
        
        //South Fork Trailhead
        let southFork = GMSMarker()
        southFork.position = CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683)
        southFork.title = "South Fork Trailhead"
        southFork.icon = GMSMarker.markerImage(with: .brown)
        southFork.map = mapView
        
        //Sugarloaf Trailhead
        let sugarTH = GMSMarker()
        sugarTH.position = CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132)
        sugarTH.title = "Sugarloaf Trailhead"
        sugarTH.icon = GMSMarker.markerImage(with: .brown)
        sugarTH.map = mapView
        
        //Mt Baldy Trailhead
        let baldyTH = GMSMarker()
        baldyTH.position = CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840)
        baldyTH.title = "Mt Baldy Trailhead"
        baldyTH.icon = GMSMarker.markerImage(with: .brown)
        baldyTH.map = mapView
        
        //Telegraph Trailhead
        let telegraphTH = GMSMarker()
        telegraphTH.position = CLLocationCoordinate2D(latitude: 34.265280, longitude: -117.605923)
        telegraphTH.title = "Mt Baldy Resort"
        telegraphTH.icon = GMSMarker.markerImage(with: .brown)
        
        //Harwood Trailhead
        let harwoodTH = GMSMarker()
        harwoodTH.position = CLLocationCoordinate2D(latitude: 34.281825, longitude: -117.617570)
        harwoodTH.title = "Mt Baldy Resort"
        harwoodTH.icon = GMSMarker.markerImage(with: .brown)
        harwoodTH.map = mapView
        telegraphTH.map = mapView
        
        //Vincent Gulch Trailhead
        let badenTH = GMSMarker()
        badenTH.position = CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986)
        badenTH.title = "Vincent Gap Trailhead"
        badenTH.icon = GMSMarker.markerImage(with: .brown)
        badenTH.map = mapView
        
        //Krakta Trailhead
        let kraktaTH = GMSMarker()
        kraktaTH.position = CLLocationCoordinate2D(latitude: 34.351453, longitude: -117.896972)
        kraktaTH.title = "Krakta Ridge Trailhead"
        kraktaTH.icon = GMSMarker.markerImage(with: .brown)
        kraktaTH.map = mapView
        
        //Waterman Trailhead
        let watermanTH = GMSMarker()
        watermanTH.position = CLLocationCoordinate2D(latitude: 34.349698, longitude: -117.928709)
        watermanTH.title = "Waterman Trailhead"
        watermanTH.icon = GMSMarker.markerImage(with: .brown)
        watermanTH.map = mapView
        
        //San Jacinto Tram Trailhead
        let sanJTram = GMSMarker()
        sanJTram.position = CLLocationCoordinate2D(latitude: 33.813169, longitude: -116.638612)
        sanJTram.title = "Palm Springs Aerial Tramway"
        sanJTram.map = mapView
        
        //Snow Creek Trailhead
        let snowCreek = GMSMarker()
        snowCreek.position = CLLocationCoordinate2D(latitude: 33.898705, longitude: -116.679772)
        snowCreek.title = "Snow Creek Trailhead"
        snowCreek.icon = GMSMarker.markerImage(with: .brown)
        snowCreek.map = mapView

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


}
