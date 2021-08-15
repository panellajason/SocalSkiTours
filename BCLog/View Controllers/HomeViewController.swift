//
//  ToursViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/16/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import Firebase
import DropDown
import BLTNBoard

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var searchTF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Search",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            searchTF.attributedPlaceholder = placeholderText
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet var barButtonItem: UIBarButtonItem!
    
    var isNewUser: Bool!
    private lazy var tours = [Tour]()
    private lazy var filteredTours = [Tour]()
    private var tourToPass: Tour!
    private lazy var isFiltered = false
    private let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["All Tours", "San Gorgonio Wilderness", "San Gabriel Mountains", "San Jacinto Area"]
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "title2")
        navigationItem.titleView = imageView
        
        if isNewUser ?? false {
            welcomeBoardManager1.showBulletin(above: self)
        }
        
        searchTF.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        tours = TourService.allTours
        menu.anchorView = collectionView
        menu.selectRow(0)
        menu.selectionAction = { [weak self] index, title in
            guard let self = self else { return }

            self.filteredTours.removeAll()
            self.tours.removeAll()
            
            switch index {
                case 0:
                    self.tours.append(contentsOf: TourService.allTours)
                case 1:
                    SanBernardinoTours.loadTours { [weak self] moreTours in
                        self?.tours.append(contentsOf: moreTours)
                    }
                case 2:
                    SanGabrielsTours.loadTours { [weak self] moreTours in
                        self?.tours.append(contentsOf: moreTours)
                    }
                case 3:
                    SanJacintoTours.loadTours { [weak self] moreTours in
                        self?.tours.append(contentsOf: moreTours)
                    }
                default:
                    self.tours.append(contentsOf: TourService.allTours)
            }
            self.collectionView.setContentOffset(.zero, animated: true)
            self.filteredTours = self.tours
            self.collectionView.reloadData()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func filterByRegion(_ sender: Any) {
        searchTF.text = ""
        self.view.endEditing(true)
        menu.show()
    }
    
    @IBAction func showOrHideSearch(_ sender: Any) {
        if topStackView.isHidden {
            //open search
            topStackView.isHidden = false
            barButtonItem.image = UIImage(systemName: "xmark")
        } else {
            //Reset everything and close search
            searchTF.text = ""
            filteredTours.removeAll()
            filteredTours = TourService.allTours
            collectionView.reloadData()
            menu.selectRow(0)
            collectionView.setContentOffset(.zero, animated: true)
            topStackView.isHidden = true
            searchTF.resignFirstResponder()
            barButtonItem.image = UIImage(systemName: "magnifyingglass")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            if string.count == 0 {
                filterText(String(text.dropLast()))
            } else {
                filterText(text + string)
            }
        }
        return true
    }
    
    func filterText(_ query: String) {
        filteredTours.removeAll()
        for tour in tours {
            if tour.tourTitle.lowercased().starts(with: query.lowercased()) || tour.tourTitle.lowercased().contains(query.lowercased()) {
                filteredTours.append(tour)
            }
        }
        isFiltered = true
        collectionView.reloadData()
        collectionView.setContentOffset(.zero, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
    
    //-----------------------------------------ONBOARDING----------------------------------------
    private lazy var welcomeBoardManager1: BLTNItemManager = {
        let item = BLTNPageItem(title: "Welcome!")
        item.appearance.titleTextColor = .systemBlue
        item.image = UIImage(named: "titlePic")
        item.actionButtonTitle = "Learn more"
        item.actionHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager2.showBulletin(above: self)
        }
        item.alternativeButtonTitle = "Skip"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
        }
        item.appearance.alternativeButtonTitleColor = .systemGray
        item.appearance.actionButtonColor = .systemBlue
        return BLTNItemManager(rootItem: item)
    }()
    
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
        item.alternativeButtonTitle = "Back"
        item.alternativeHandler = { _ in
            self.dismiss(animated: true, completion: nil)
            self.welcomeBoardManager1.showBulletin(above: self)
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
        item.actionHandler = { _ in
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

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if !filteredTours.isEmpty {
            return filteredTours.count
        }
        return isFiltered ? 0 : tours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToursCollectionViewCell.identifier, for: indexPath) as! ToursCollectionViewCell
        
        if !filteredTours.isEmpty {
            cell.configure(with: filteredTours[indexPath.row])
        }
        else {
            cell.configure(with: tours[indexPath.row])
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !filteredTours.isEmpty {
            tourToPass = filteredTours[indexPath.row]
        }
        else {
            tourToPass = tours[indexPath.row]
        }
        self.performSegue(withIdentifier: "toDetailTour", sender: self)
    }
}
