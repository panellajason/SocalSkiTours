//
//  ToursViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/16/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var searchTF: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet var barButtonItem: UIBarButtonItem!
    
    var tours = [Tour]()
    var filteredTours = [Tour]()
    var tourToPass: Tour!
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "title2")
        navigationItem.titleView = imageView
                
        tours = TourService.allTours
        
        searchTF.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func filterByRegion(_ sender: Any) {
        searchTF.text = ""
        filteredTours.removeAll()
        tours.removeAll()

        SanGabrielsTours.loadTours { moreTours in
            self.tours.append(contentsOf: moreTours)
        }
        
        filteredTours = tours
        collectionView.reloadData()
            
    }
    
    @IBAction func showOrHideSearch(_ sender: Any) {
        if topStackView.isHidden {
            topStackView.isHidden = false
            barButtonItem.image = UIImage(systemName: "xmark")
        } else {
            searchTF.text = ""
            filteredTours.removeAll()
            filteredTours = TourService.allTours
            collectionView.reloadData()

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
            if tour.tourTitle.lowercased().starts(with: query.lowercased()) {
                filteredTours.append(tour)
            }
        }
        filtered = true
        collectionView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        if (segue.identifier == "toDetailTour") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
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
        return filtered ? 0 : tours.count
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
        self.showSpinner(onView: self.view)

    }
}