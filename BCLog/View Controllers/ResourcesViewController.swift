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
    
    @IBAction func openHelp(_ sender: Any) {
        welcomeBoardManager2.showBulletin(above: self)
    }
    
    private lazy var welcomeBoardManager2: BLTNItemManager = {
        let item = BLTNPageItem(title: "Getting started")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab1")
        item.descriptionText = "The Home tab displays the entire collection of ski tours."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager2a.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Close"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager2a: BLTNItemManager = {
        let item = BLTNPageItem(title: "Home")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab2a")
        item.descriptionText = "Tap on any tour to view its details. Tap on the search icon to filter by keyword or region."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { [weak self] _ in
            guard let self = self else { return }

            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
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
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3a.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager2a.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager3a: BLTNItemManager = {
        let item = BLTNPageItem(title: "Tour Details")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab3")
        item.descriptionText = "View the tour's route on Google maps or a 5-day weather forecast for the summit (from National Weather Service)."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3b.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager3b: BLTNItemManager = {
        let item = BLTNPageItem(title: "Tour Details")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab4")
        item.descriptionText = "The trailhead, one-way distance, elevation, aspect, and slope angle are displayed, as well as a short description."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager4.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3a.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    
    private lazy var welcomeBoardManager4: BLTNItemManager = {
        let item = BLTNPageItem(title: "Map")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab5")
        item.descriptionText = "The Map tab displays routes, trailheads, and summit markers for all of the ski tours."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager4a.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager3b.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager4a: BLTNItemManager = {
        let item = BLTNPageItem(title: "Map")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab6")
        item.descriptionText = "Default view is terrain (elevation is shown). Tap on the globe icon to change to satellite view. Blue icons are summit markers and black icons are trailhead markers. Tap on summit markers to view the tour's details."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager5.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager4.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager5: BLTNItemManager = {
        let item = BLTNPageItem(title: "Resources")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab7")
        item.descriptionText = "The Resources tab contains links to information about the snow and weather, as well as links to live cameras. Always know before you go and check the avalanche forecast/weather daily."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager6.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager4a.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
    private lazy var welcomeBoardManager6: BLTNItemManager = {
        let item = BLTNPageItem(title: "Favorites")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "tab8")
        item.descriptionText = "The Favorites tab displays the tours you have favorited."
        item.actionButtonTitle = "Continue"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager6a.showBulletin(above: self)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
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
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
        }
        item.appearance.actionButtonColor = .systemBlue
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager6.showBulletin(above: self)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        return BLTNItemManager(rootItem: item)
    }()
}
