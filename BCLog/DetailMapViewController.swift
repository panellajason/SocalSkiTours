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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = passedTour.tourTitle
        
        let location = passedTour.tourID.split(separator: " ").map{ String($0) }
                    
        let lat = (location[0] as NSString).doubleValue
        let long = (location[1] as NSString).doubleValue

        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 14.0)
        
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.delegate = self
        mapView.mapType = .terrain
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
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

    }
    

    

}
