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
    
    @IBAction func openGOESWest(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://www.star.nesdis.noaa.gov/GOES/sector_band.php?sat=G17&sector=psw&band=GEOCOLOR&length=24")!)
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
    
    @IBAction func openMtBaldyCamera(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string:"https://mtbaldyresort.com/webcam/")!)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openHelp(_ sender: Any) {
        welcomeBoardManager2.showBulletin(above: self)
    }
    
    //-----------------------------------------ONBOARDING----------------------------------------
    private lazy var welcomeBoardManager2: BLTNItemManager = {
        let item = BLTNPageItem(title: "Getting started")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab1")
        item.descriptionText = "The Home tab displays the entire collection of ski tours."
        item.actionButtonTitle = "Continue (1 of 7)"
        item.actionHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager2a.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager2a: BLTNItemManager = {
        let item = BLTNPageItem(title: "Home")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab2a")
        item.descriptionText = "Tap on any tour to view its details. Tap on the search icon to filter by keyword or region."
        item.actionButtonTitle = "Continue (2 of 7)"
        item.actionHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager2.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager3: BLTNItemManager = {
        let item = BLTNPageItem(title: "Tour Details")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab2")
        item.descriptionText = "Once a tour is chosen, swipe-to-view all of its photos and pinch-to-zoom. Tap on the star icon to favorite."
        item.actionButtonTitle = "Continue (3 of 7)"
        item.actionHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager4.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager2a.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    
    private lazy var welcomeBoardManager4: BLTNItemManager = {
        let item = BLTNPageItem(title: "Map")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab5")
        item.descriptionText = "The Map tab displays routes, trailheads, and summit markers for all of the ski tours. Tap on summit markers (blue icons) for details."
        item.actionButtonTitle = "Continue (4 of 7)"
        item.actionHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager5.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager5: BLTNItemManager = {
        let item = BLTNPageItem(title: "Resources")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab7")
        item.descriptionText = "The Resources tab contains links to information about the snow and weather, as well as links to live cameras. Always know before you go and check the avalanche forecast/weather daily."
        item.actionButtonTitle = "Continue (5 of 7)"
        item.actionHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager6.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager4.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager6: BLTNItemManager = {
        let item = BLTNPageItem(title: "Favorites")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab8")
        item.descriptionText = "The Favorites tab displays the tours you have favorited."
        item.actionButtonTitle = "Continue (6 of 7)"
        item.actionHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager6a.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager5.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager6a: BLTNItemManager = {
        let item = BLTNPageItem(title: "Favorites")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab9")
        item.descriptionText = "Tap on any tour to view its details. Swipe to delete and press-and-hold to reorganize. Tap on the account icon to logout."
        item.actionButtonTitle = "Done"
        item.actionHandler = {[weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = {[weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager6.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
}
