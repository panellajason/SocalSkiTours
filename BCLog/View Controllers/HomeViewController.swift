//
//  ToursViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/16/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import DropDown
import BLTNBoard
import FirebaseAuth

class HomeViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var searchTF: UITextField! {
        didSet {
            let placeholderText = NSAttributedString(string: "Search",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            searchTF.attributedPlaceholder = placeholderText
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topStackView: UIStackView!
    
    var isNewUser: Bool!
    private lazy var isFiltered = false
    private lazy var tours = [Tour]()
    private lazy var filteredTours = [Tour]()
    private var tourToPass: Tour!
    private let mainMenu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Region", "Difficulty", "Distance"]
        return menu
    }()
    private let regionMenu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["All Tours", "San Bernardino Mountains", "San Gabriel Mountains", "San Jacinto Mountains"]
        return menu
    }()
    private let difficultyMenu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Easiest", "Most Difficult"]
        return menu
    }()
    private let distanceMenu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["Shortest Approach", "Longest Approach"]
        return menu
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "title2")
        navigationItem.titleView = imageView
        
        if isNewUser ?? false {
            let vc = PreOnboardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
        
        searchTF.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        tours = TourService.allTours
        setUpMainMenu()
        setUpRegionMenu()
        setUpDifficultyMenu()
        setUpDistanceMenu()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func filterByRegion(_ sender: Any) {
        
        self.view.endEditing(true)
        mainMenu.show()
    }
    
    @IBAction func showOrHideSearch(_ sender: Any) {
        
        if topStackView.isHidden {
            //open search
            topStackView.isHidden = false
            
        } else {
            //Reset everything and close search
            topStackView.isHidden = true
            isFiltered = false
            searchTF.text = ""
            let placeholderText = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            searchTF.attributedPlaceholder = placeholderText
            searchTF.resignFirstResponder()
            filteredTours.removeAll()
            regionMenu.selectRow(0)
            collectionView.reloadData()
            collectionView.setContentOffset(.zero, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 170, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltered {
            return filteredTours.count
        }
        
        return tours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToursCollectionViewCell.identifier, for: indexPath) as! ToursCollectionViewCell
        
        if isFiltered {
            cell.configure(with: filteredTours[indexPath.row])
        }
        else {
            cell.configure(with: tours[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isFiltered {
            tourToPass = filteredTours[indexPath.row]
        }
        else {
            tourToPass = tours[indexPath.row]
        }
        
        self.performSegue(withIdentifier: "toDetailTour", sender: self)
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
    
    private func setUpMainMenu() {
        mainMenu.anchorView = collectionView
        mainMenu.clearSelection()
        
        mainMenu.selectionAction = { [weak self] index, title in
            guard let self = self else { return }
            
            switch index {
                
                case 0:
                    self.regionMenu.show()
                
                case 1:
                   self.difficultyMenu.show()
                
                case 2:
                    self.distanceMenu.show()
                
                default:
                    self.regionMenu.show()
            }
        }
    }
    
    private func setUpRegionMenu() {
        regionMenu.anchorView = collectionView
        regionMenu.clearSelection()
        
        regionMenu.selectionAction = { [weak self] index, title in
            guard let self = self else { return }

            self.filteredTours.removeAll()
            var placeholderText = NSAttributedString(string: "All Tours", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            switch index {
                
                case 0:
                    self.filteredTours.append(contentsOf: self.tours)
                
                case 1:
                    SanBernardinoTours.loadTours { [weak self] moreTours in
                        self?.filteredTours.append(contentsOf: moreTours)
                    }
                    placeholderText = NSAttributedString(string: "San Bernardino Mountains", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
                case 2:
                    SanGabrielsTours.loadTours { [weak self] moreTours in
                        self?.filteredTours.append(contentsOf: moreTours)
                    }
                    placeholderText = NSAttributedString(string: "San Gabriel Mountains", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
                case 3:
                    SanJacintoTours.loadTours { [weak self] moreTours in
                        self?.filteredTours.append(contentsOf: moreTours)
                    }
                    placeholderText = NSAttributedString(string: "San Jacinto Mountains", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
                default:
                    self.filteredTours.append(contentsOf: self.tours)
            }
            
            self.searchTF.text = ""
            self.searchTF.attributedPlaceholder = placeholderText
            self.isFiltered = true
            self.collectionView.setContentOffset(.zero, animated: true)
            self.collectionView.reloadData()
        }
    }
    
    private func setUpDifficultyMenu() {
        difficultyMenu.anchorView = collectionView
        difficultyMenu.clearSelection()
        
        difficultyMenu.selectionAction = { [weak self] index, title in
            guard let self = self else { return }
            
            switch index {
                
                case 0:
                    self.regionMenu.show()
                
                case 1:
                   self.regionMenu.show()
                
                default:
                    self.regionMenu.show()
            }
        }
    }
    
    private func setUpDistanceMenu() {
        distanceMenu.anchorView = collectionView
        distanceMenu.clearSelection()
        
        distanceMenu.selectionAction = { [weak self] index, title in
            guard let self = self else { return }
            
            switch index {
                
                case 0:
                    self.regionMenu.show()
                
                case 1:
                   self.regionMenu.show()
                
                default:
                    self.regionMenu.show()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
}
