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
    private lazy var tours = [Tour]()
    private lazy var filteredTours = [Tour]()
    private var tourToPass: Tour!
    private let filterMenu: DropDown = {
        let menu = DropDown()
        menu.dataSource = ["All Tours", "San Gorgonio Wilderness", "San Gabriel Mountains", "San Jacinto Area"]
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
        setUpMenu()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func filterByRegion(_ sender: Any) {
        
        searchTF.text = ""
        self.view.endEditing(true)
        filterMenu.show()
    }
    
    @IBAction func showOrHideSearch(_ sender: Any) {
        
        if topStackView.isHidden {
            //open search
            topStackView.isHidden = false
            
        } else {
            //Reset everything and close search
            searchTF.text = ""
            filteredTours.removeAll()
            filteredTours = TourService.allTours
            collectionView.reloadData()
            filterMenu.selectRow(0)
            collectionView.setContentOffset(.zero, animated: false)
            topStackView.isHidden = true
            searchTF.resignFirstResponder()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if !filteredTours.isEmpty {
            return filteredTours.count
        }
        
        return tours.count
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if !filteredTours.isEmpty {
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
        
        collectionView.reloadData()
        collectionView.setContentOffset(.zero, animated: true)
    }
    
    private func setUpMenu() {
        
        filterMenu.anchorView = collectionView
        filterMenu.selectRow(0)
        filterMenu.selectionAction = { [weak self] index, title in
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
}
