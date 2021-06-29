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


    override func viewDidLoad() {
        super.viewDidLoad()

        //default camera view
        let camera = GMSCameraPosition.camera(withLatitude: 34.070986, longitude: -117.326830, zoom: 8.0)
            
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView.delegate = self
        mapView.mapType = .terrain
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        view.addSubview(mapView)
        
        let southFork = GMSMarker()
        southFork.position = CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683)
        southFork.title = "South Fork Trailhead"
        southFork.icon = GMSMarker.markerImage(with: .brown)
        southFork.map = mapView
        
        let sugarTH = GMSMarker()
        sugarTH.position = CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132)
        sugarTH.title = "2N23 and CA 38"
        sugarTH.icon = GMSMarker.markerImage(with: .brown)
        sugarTH.map = mapView
        
        let baldyTH = GMSMarker()
        baldyTH.position = CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840)
        baldyTH.title = "Mt Baldy Trailhead"
        baldyTH.icon = GMSMarker.markerImage(with: .brown)
        baldyTH.map = mapView
        
        let badenTH = GMSMarker()
        badenTH.position = CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986)
        badenTH.title = "Vincent Gap Trailhead"
        badenTH.icon = GMSMarker.markerImage(with: .brown)
        badenTH.map = mapView
        
       let kraktaTH = GMSMarker()
       kraktaTH.position = CLLocationCoordinate2D(latitude: 34.351453, longitude: -117.896972)
       kraktaTH.title = "Krakta Ridge Trailhead"
       kraktaTH.icon = GMSMarker.markerImage(with: .brown)
       kraktaTH.map = mapView
       
       let watermanTH = GMSMarker()
       watermanTH.position = CLLocationCoordinate2D(latitude: 34.349698, longitude: -117.928709)
       watermanTH.title = "Waterman Trailhead"
       watermanTH.icon = GMSMarker.markerImage(with: .brown)
       watermanTH.map = mapView
        
        
        let sugPath = GMSMutablePath()
        sugPath.add(CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.225995, longitude: -116.813088))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.218608, longitude: -116.805902))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215235, longitude: -116.803571))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215126, longitude: -116.795548))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.209479, longitude: -116.794252))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.204253, longitude: -116.796951))
        
        let sugTopPath = GMSMutablePath()
        sugTopPath.add(CLLocationCoordinate2D(latitude: 34.225995, longitude: -116.813088))
        sugTopPath.add(CLLocationCoordinate2D(latitude: 34.218420, longitude: -116.817519))
        sugTopPath.add(CLLocationCoordinate2D(latitude: 34.212041, longitude: -116.819643))
        sugTopPath.add(CLLocationCoordinate2D(latitude: 34.203841, longitude: -116.816965))
        sugTopPath.add(CLLocationCoordinate2D(latitude: 34.198727, longitude: -116.814428))
        
        let sfPath = GMSMutablePath()
        //to christmas tree hill
        sfPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.130464, longitude: -116.843415))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.120446, longitude: -116.842900))
        
        let altTreesPath = GMSMutablePath()
        altTreesPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altTreesPath.add(CLLocationCoordinate2D(latitude: 34.137137, longitude: -116.865890))

        let altAvyPath = GMSMutablePath()
        altAvyPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altAvyPath.add(CLLocationCoordinate2D(latitude: 34.144195, longitude: -116.853840))
        altAvyPath.add(CLLocationCoordinate2D(latitude: 34.136789, longitude: -116.858281))
        altAvyPath.add(CLLocationCoordinate2D(latitude: 34.131813, longitude: -116.866294))

        let charltonPath = GMSMutablePath()
        charltonPath.add(CLLocationCoordinate2D(latitude: 34.116077, longitude: -116.842706))
        charltonPath.add(CLLocationCoordinate2D(latitude: 34.114104, longitude: -116.851331))
        charltonPath.add(CLLocationCoordinate2D(latitude: 34.116171, longitude: -116.853880))
        
        let gorgPath = GMSMutablePath()
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.130464, longitude: -116.843415))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.118907, longitude: -116.839350))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.108832, longitude: -116.838182))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.099683, longitude: -116.838692))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.099769, longitude: -116.836071))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.101406, longitude: -116.834642))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.101979, longitude: -116.830673))

        //to jepson NE
        sfPath.add(CLLocationCoordinate2D(latitude: 34.116077, longitude: -116.842706))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.110304, longitude: -116.843963))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.107230, longitude: -116.850109))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.103873, longitude: -116.850108))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.103435, longitude: -116.847386))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.101618, longitude: -116.843024))

        let mankerPath = GMSMutablePath()
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.266502, longitude: -117.627251))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.266809, longitude: -117.631681))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.270642, longitude: -117.632719))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.267859, longitude: -117.630642))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.268151, longitude: -117.629389))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.268303, longitude: -117.630210))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.274164, longitude: -117.631524))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.281466, longitude: -117.639026))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.280631, longitude: -117.641719))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.278896, longitude: -117.642305))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.278029, longitude: -117.644836))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.281319, longitude: -117.647120))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.283921, longitude: -117.646997))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.286354, longitude: -117.644966))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.289109, longitude: -117.647143))

        let badenPath = GMSMutablePath()
        badenPath.add(CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.372731, longitude: -117.755967))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.371467, longitude: -117.754773))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.368462, longitude: -117.758920))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.360693, longitude: -117.763157))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.358660, longitude: -117.764692))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.358217, longitude: -117.764430))
        
        let kraktaPath = GMSMutablePath()
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351453, longitude: -117.896972))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351197, longitude: -117.897462))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351116, longitude: -117.899042))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.349336, longitude: -117.899723))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.347442, longitude: -117.898000))
        
        let watermanPath = GMSMutablePath()
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349698, longitude: -117.928709))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349296, longitude: -117.928535))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349689, longitude: -117.926171))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.348609, longitude: -117.927180))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.346928, longitude: -117.925932))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.345188, longitude: -117.929851))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.345665, longitude: -117.933310))
        
        let kraktaLine = GMSPolyline(path: kraktaPath)
        kraktaLine.strokeWidth = 3
        kraktaLine.map = mapView
        
        let waterLine = GMSPolyline(path: watermanPath)
        waterLine.strokeWidth = 3
        waterLine.map = mapView
        
        let badenLine = GMSPolyline(path: badenPath)
        badenLine.strokeWidth = 3
        badenLine.map = mapView
        
        let mankerLine = GMSPolyline(path: mankerPath)
        mankerLine.strokeWidth = 3
        mankerLine.map = mapView
        
        let sugarLine = GMSPolyline(path: sugPath)
        sugarLine.strokeWidth = 3
        sugarLine.map = mapView
        
        let sugarTopLine = GMSPolyline(path: sugTopPath)
        sugarTopLine.strokeWidth = 3
        sugarTopLine.map = mapView
        
        let charLine = GMSPolyline(path: charltonPath)
        charLine.strokeWidth = 3
        charLine.map = mapView
        
        let altTreesLine = GMSPolyline(path: altTreesPath)
        altTreesLine.strokeWidth = 3
        altTreesLine.map = mapView
        
        let altAvyLine = GMSPolyline(path: altAvyPath)
        altAvyLine.strokeWidth = 3
        altAvyLine.map = mapView
        
        let gorgLine = GMSPolyline(path: gorgPath)
        gorgLine.strokeWidth = 3
        gorgLine.map = mapView
        
        let polyline = GMSPolyline(path: sfPath)
        polyline.strokeWidth = 3
        polyline.map = mapView
        
        let jepsonNW = GMSMarker()
        jepsonNW.position = CLLocationCoordinate2D(latitude: 34.103435, longitude: -116.847386)
        jepsonNW.title = "Jepson Peak"
        jepsonNW.snippet = "N chutes"
        jepsonNW.map = mapView
        
        let jepsonNE = GMSMarker()
        jepsonNE.position = CLLocationCoordinate2D(latitude: 34.101618, longitude: -116.843024)
        jepsonNE.title = "Jepson Peak"
        jepsonNE.snippet = "NE Chutes"
        jepsonNE.map = mapView
        
        let bigDraw = GMSMarker()
        bigDraw.position = CLLocationCoordinate2D(latitude: 34.099683, longitude: -116.838692)
        bigDraw.title = "San Gorgonio"
        bigDraw.snippet = "The Big Draw"
        bigDraw.map = mapView
        
        let gorgNW = GMSMarker()
        gorgNW.position = CLLocationCoordinate2D(latitude: 34.101406, longitude: -116.834642)
        gorgNW.title = "San Gorgonio"
        gorgNW.snippet = "NW Chutes"
        gorgNW.map = mapView
        
        let gorgN = GMSMarker()
        gorgN.position = CLLocationCoordinate2D(latitude: 34.101979, longitude: -116.830673)
        gorgN.title = "San Gorgonio"
        gorgN.snippet = "North Slope"
        gorgN.map = mapView
        
        let charDL = GMSMarker() 
        charDL.position = CLLocationCoordinate2D(latitude: 34.114789, longitude: -116.852401)
        charDL.title = "Charlton Peak"
        charDL.snippet = "Dog Leg"
        charDL.map = mapView
        
        let charMain = GMSMarker()
        charMain.position = CLLocationCoordinate2D(latitude: 34.116171, longitude: -116.853880)
        charMain.title = "Charlton Peak"
        charMain.snippet = "Main Gully"
        charMain.map = mapView
        
        let charDol = GMSMarker()
        charDol.position = CLLocationCoordinate2D(latitude: 34.116468, longitude: -116.854930)
        charDol.title = "Charlton Peak"
        charDol.snippet = "Dollar Col"
        charDol.map = mapView
                
        let alt = GMSMarker()
        alt.position = CLLocationCoordinate2D(latitude: 34.131813, longitude: -116.866294)
        alt.title = "Alto Diablo"
        alt.snippet = "Avy Path"
        alt.map = mapView
        
        let altTrees = GMSMarker()
        altTrees.position = CLLocationCoordinate2D(latitude: 34.137137, longitude: -116.865890)
        altTrees.title = "Alto Diablo"
        altTrees.snippet = "North Trees"
        altTrees.map = mapView
       
        let sugarloaf = GMSMarker()
        sugarloaf.position = CLLocationCoordinate2D(latitude: 34.204253, longitude: -116.796951)
        sugarloaf.title = "Sugarloaf"
        sugarloaf.snippet = "Rock Bowl"
        sugarloaf.map = mapView
        
        let sugarSum = GMSMarker()
        sugarSum.position = CLLocationCoordinate2D(latitude: 34.198727, longitude: -116.814428)
        sugarSum.title = "Sugarloaf"
        sugarSum.snippet = "Summit"
        sugarSum.map = mapView
        
        let baldyBowl = GMSMarker()
        baldyBowl.position = CLLocationCoordinate2D(latitude: 34.286354, longitude: -117.644966)
        baldyBowl.title = "Mt Baldy"
        baldyBowl.snippet = "Baldy Bowl"
        baldyBowl.map = mapView
        
        let baldyN = GMSMarker()
        baldyN.position = CLLocationCoordinate2D(latitude: 34.289109, longitude: -117.647143)
        baldyN.title = "Mt Baldy"
        baldyN.snippet = "North Face"
        baldyN.map = mapView
        
        let baden = GMSMarker()
        baden.position = CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169)
        baden.title = "Baden Powell"
        baden.snippet = "NE Gullies"
        baden.map = mapView
        
        let badenE = GMSMarker()
        badenE.position = CLLocationCoordinate2D(latitude: 34.358358, longitude: -117.764446)
        badenE.title = "Baden Powell"
        badenE.snippet = "East Face"
        badenE.map = mapView
        
        let krakta = GMSMarker()
        krakta.position = CLLocationCoordinate2D(latitude: 34.347518, longitude: -117.897992)
        krakta.title = "Krakta Ridge"
        krakta.snippet = "Ski Area"
        krakta.map = mapView
        
        let waterman = GMSMarker()
        waterman.position = CLLocationCoordinate2D(latitude: 34.345932, longitude: -117.933253)
        waterman.title = "Mount Waterman"
        waterman.snippet = "Ski Area"
        waterman.map = mapView
    }
        
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        if marker.title == "South Fork Trailhead" || marker.title == "2N23 and CA 38" || marker.title == "Mt Baldy Trailhead" {
            
        }
        else {
            let id = marker.position.latitude.description + " " +  marker.position.longitude.description
            
            print(id)
            
            TourService.findTour(withId: id) { tour in
                self.tourToPass = tour
                
                self.performSegue(withIdentifier: "toDetailTour2", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        if (segue.identifier == "toDetailTour2") {
            
            let viewController = segue.destination as! DetailTourViewController
       
            viewController.passedTour = tourToPass
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
