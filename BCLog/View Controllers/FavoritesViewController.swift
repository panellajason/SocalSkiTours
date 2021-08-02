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
import BLTNBoard

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate {
    
    var favoriteTours = [Tour]()
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    var tourToPass: Tour!
    @IBOutlet weak var tableView: UITableView!
    private lazy var boardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Account")
        item.appearance.titleTextColor = .systemBlue
        item.actionButtonTitle = "Logout"
        item.appearance.actionButtonColor = .systemRed
        item.actionHandler = { _ in
            try! Auth.auth().signOut()
            UserService.currentUserProfile = nil
            self.performSegue(withIdentifier: "toLogout", sender: self)
        }
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteTours = UserService.currentUserProfile!.favoriteTours
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 38))
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "favorites")
        navigationItem.titleView = imageView
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
    }
    
    @IBAction func openAccountPage(_ sender: Any) {
        boardManager.showBulletin(above: self)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .normal, title: nil) { (_, _, completionHandler) in
                
                self.removeFromFavorites(indexPathToDelete: indexPath)
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
        return favoriteTours.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let favoritesCell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as! FavoritesTableViewCell
        favoritesCell.configure(with: favoriteTours[indexPath.row])
        return favoritesCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tourToPass = favoriteTours[indexPath.row]
        self.performSegue(withIdentifier: "toDetailTour3", sender: self)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mover = favoriteTours.remove(at: sourceIndexPath.row)
        favoriteTours.insert(mover, at: destinationIndexPath.row)
        UserService.currentUserProfile?.favoriteTours = favoriteTours
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = favoriteTours[indexPath.row]
        return [ dragItem ]
    }
    
    func removeFromFavorites(indexPathToDelete: IndexPath) {
        db.collection("user_favorites").whereField("tour_id", isEqualTo: self.favoriteTours[indexPathToDelete.row].tourID).whereField("user_id", isEqualTo: UserService.currentUserProfile?.userID as Any)
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
                                self.favoriteTours.remove(at: indexPathToDelete.row)
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour3") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
}
