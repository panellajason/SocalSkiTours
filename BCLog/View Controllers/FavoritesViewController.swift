//
//  AccountViewController.swift
//  BCLog
//
//  Created by Jason Panella on 5/16/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import FirebaseAuth
import BLTNBoard

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    private var favoriteTours = [Tour]()
    private var tourToPass: Tour!
    
    private lazy var boardManager: BLTNItemManager = {
        let item = BLTNPageItem(title: "Account")
        item.appearance.titleTextColor = .systemBlue
        item.actionButtonTitle = "Logout"
        item.appearance.actionButtonColor = .systemRed
        item.actionHandler = { [weak self] _ in
            guard let self = self else { return }

            try! Auth.auth().signOut()
            DatabaseService.currentUserProfile = nil
            self.performSegue(withIdentifier: "toLogout", sender: self)
        }
        return BLTNItemManager(rootItem: item)
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favoriteTours = DatabaseService.currentUserProfile!.favoriteTours
        tableView.reloadData()
        
        if favoriteTours.count == 0 {
            tableView.isHidden = true
        } else {
            tableView.isHidden = false
        }
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
        
            let deleteAction = UIContextualAction(style: .normal, title: nil) { [weak self] (_, _, completionHandler) in
                guard let self = self else { return }

                DatabaseService.removeFromFavorites(tourID: self.favoriteTours[indexPath.row].tourID) { [weak self] error in
                    
                    guard error == nil else {
                        let errorAlert = UIAlertController(title: "Error", message: "Unable to remove from favorites.", preferredStyle: .alert)
                        errorAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                        self?.present(errorAlert, animated: true)
                        return
                    }
                    
                    self?.favoriteTours.remove(at: indexPath.row)
                    self?.tableView.reloadData()
                    if self?.favoriteTours.count == 0 {
                        self?.tableView.isHidden = true
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
        DatabaseService.currentUserProfile?.favoriteTours = favoriteTours
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = favoriteTours[indexPath.row]
        return [ dragItem ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "toDetailTour3") {
            let viewController = segue.destination as! DetailTourViewController
            viewController.passedTour = tourToPass
        }
    }
}
