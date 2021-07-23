//
//  ResourscesViewController.swift
//  BCLog
//
//  Created by Jason Panella on 7/20/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import SafariServices

class ResourcesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "resources")
        navigationItem.titleView = imageView
    }
    
    @IBAction func openSocalSnow(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://socalsnow.org")!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openAIARE(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://avtraining.org")!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openBensWeather(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://bensweather.com")!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openDailySnow(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://opensnow.com/dailysnow/southerncalifornia")!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openNWS(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://www.wpc.ncep.noaa.gov/qpf/day1-7.shtml")!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openSocalMountainsCameras(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "http://socalmountains.com/webcams")!)
        present(vc, animated: true, completion: nil)
    }

    @IBAction func openTramCamera(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://pstramway.com/long-valley-cam")!)
        present(vc, animated: true, completion: nil)
    }
}
