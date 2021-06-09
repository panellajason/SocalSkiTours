//
//  AccountViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/16/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteTours = [Tour]()
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var tourToPass: Tour!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "favorites")
        navigationItem.titleView = imageView
                
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        favoriteTours = UserService.currentUserProfile!.favoriteTours
        tableView.reloadData()
    }
    
   @IBAction func logOut(_ sender: Any) {
       try! Auth.auth().signOut()
       self.performSegue(withIdentifier: "toLogout", sender: self)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .normal, title: nil) { (_, _, completionHandler) in
                
                self.db.collection("user_favorites").whereField("tour_id", isEqualTo: self.favoriteTours[indexPath.row].tourID).whereField("user_id", isEqualTo: UserService.currentUserProfile?.userID as Any)
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            if !querySnapshot!.documents.isEmpty {
                                
                                self.db.collection("user_favorites").document(querySnapshot!.documents[0].documentID).delete() { err in
                                    if let err = err {
                                        print("Error removing document: \(err)")
                                    } else {
                                        print("Document successfully removed!")
                                        self.favoriteTours.remove(at: indexPath.row)
                                        self.tableView.reloadData()
                                    }
                                }
                            }
                        }
                }
                    
                completionHandler(true)
            }
            deleteAction.image = UIImage(systemName: "xmark.circle")
            deleteAction.backgroundColor = .black
            return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteTours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
        cell.configure(with: favoriteTours[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tourToPass = favoriteTours[indexPath.row]
        self.performSegue(withIdentifier: "toDetailTour3", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){

        if (segue.identifier == "toDetailTour3") {
            
            let viewController = segue.destination as! DetailTourViewController
       
            viewController.passedTour = tourToPass
        }
    }
}
