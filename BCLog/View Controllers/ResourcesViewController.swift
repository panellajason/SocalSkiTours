//
//  ResourscesViewController.swift
//  BCLog
//
//  Created by Jason Panella on 7/20/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import SafariServices
import BLTNBoard

class ResourcesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openSocalSnow(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://socalsnow.org")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openAIARE(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://avtraining.org")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openBensWeather(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://bensweather.com")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openGOESWest(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://www.star.nesdis.noaa.gov/GOES/sector_band.php?sat=G17&sector=psw&band=GEOCOLOR&length=24")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openNWS(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://www.wpc.ncep.noaa.gov/qpf/day1-7.shtml")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openCalTrans(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://roads.dot.ca.gov/roadscell.php")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openBigBearRoads(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"http://www.socalmountains.com/roads/")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openSocalMountainsCameras(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://socalmountains.com/webcams")!)
        present(vc, animated: false, completion: nil)
    }

    @IBAction func openTramCamera(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://pstramway.com/long-valley-cam")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openMtBaldyCamera(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://mtbaldyresort.com/baldyvision/")!)
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func openHelp(_ sender: Any) {
        let vc = PreOnboardingViewController()
        vc.modalPresentationStyle = .fullScreen 
        present(vc, animated: false, completion: nil)
    }
}
