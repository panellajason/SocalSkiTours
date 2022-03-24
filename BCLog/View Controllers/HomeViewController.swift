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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "title2")
        navigationItem.titleView = imageView
        
        searchTF.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        tours = TourService.allTours
        setUpMainMenu()
        setUpRegionMenu()
        
        if isNewUser ?? false {
            let vc = PreOnboardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
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
            collectionView.reloadData()
            collectionView.setContentOffset(.zero, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (UIScreen.main.bounds.width <= 395.0) {
            return CGSize(width: 170, height: 200)
        }

        return CGSize(width: 190, height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltered {
            return filteredTours.count
        }
        
        return tours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToursCollectionViewCell.identifier, for: indexPath) as! ToursCollectionViewCell
        
        var tour: Tour
        
        if isFiltered {
            tour = filteredTours[indexPath.row]
        } else {
            tour = tours[indexPath.row]
        }
        
        cell.configure(with: tour.tourTitle, tourImage: tour.tourImages[0])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isFiltered {
            tourToPass = filteredTours[indexPath.row]
        } else {
            tourToPass = tours[indexPath.row]
        }
        
        self.performSegue(withIdentifier: "toDetailTour", sender: self)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
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
    
    private func filterText(_ query: String) {
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
        mainMenu.selectionAction = { [weak self] index, title in
            guard let self = self else { return }
            
            switch index {
                
                case 0:
                    self.regionMenu.show()
                
                case 1:
                    self.filterByDifficulty()
                
                case 2:
                    self.filterByDistance()
                
                default:
                    break
            }
            self.mainMenu.clearSelection()
        }
    }
    
    private func setUpRegionMenu() {
        regionMenu.anchorView = collectionView
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
                    break
            }
            
            self.resetCollectionView()
            self.regionMenu.clearSelection()
            self.searchTF.attributedPlaceholder = placeholderText
        }
    }
    
    private func filterByDifficulty() {
        let sorted1 = self.tours.sorted(by: { $0.tourDistance < $1.tourDistance })
        let sorted2 = sorted1.sorted(by: { $0.tourAngle < $1.tourAngle })
        filteredTours = sorted2.sorted(by: { $0.tourDifficulty < $1.tourDifficulty })
        
        let placeholderText = NSAttributedString(string: "Difficulty: Least to Most", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        searchTF.attributedPlaceholder = placeholderText
        resetCollectionView()
    }
    
    private func filterByDistance() {
        filteredTours = self.tours.sorted(by: { $0.tourDistance < $1.tourDistance })
        let placeholderText = NSAttributedString(string: "Distance: Shortest to Longest", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        searchTF.attributedPlaceholder = placeholderText
        resetCollectionView()
    }
    
    private func resetCollectionView() {
        searchTF.text = ""
        isFiltered = true
        collectionView.setContentOffset(.zero, animated: true)
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        UIView.setAnimationsEnabled(true)
    }
}
