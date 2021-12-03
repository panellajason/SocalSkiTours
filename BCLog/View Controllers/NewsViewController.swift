//
//  NewsViewController.swift
//  BCLog
//
//  Created by Jason Panella on 12/1/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var resortsCollectionView: UICollectionView!
    @IBOutlet weak var refreshLabel: UILabel!
    
    private lazy var articles = [Article]()
    private lazy var resorts = [Resort]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        articles = DatabaseService.newsArticles
        resorts = DatabaseService.skiResorts
        resortsCollectionView.reloadData()
        articlesTableView.reloadData()
        if articles.count == 0 && resorts.count == 0 {
            refreshLabel.isHidden = false
        } else {
            refreshLabel.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        resortsCollectionView.dataSource = self
        resortsCollectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.resortsCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = SFSafariViewController(url: URL(string: DatabaseService.skiResorts[indexPath.row].url)!)
        present(vc, animated: false, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resorts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResortsCollectionViewCell.identifier, for: indexPath) as! ResortsCollectionViewCell
        cell.configure(with: resorts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 100)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SFSafariViewController(url: URL(string: DatabaseService.newsArticles[indexPath.row].url)!)
        present(vc, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        newsCell.configure(with: articles[indexPath.row])
        return newsCell
    }

    @IBAction func openResources(_ sender: Any) {
        self.performSegue(withIdentifier: "toResources", sender: self)
    }
    
    @IBAction func refresh(_ sender: Any) {
       
        if articles.count == 0 {
            DatabaseService.getArticles()
            articles = DatabaseService.newsArticles
        } else {
            let indexPath = IndexPath(row: 0, section: 0)
            self.articlesTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        if resorts.count == 0 {
            DatabaseService.getResortForecast()
            resorts = DatabaseService.skiResorts
        } else {
            resortsCollectionView.setContentOffset(.zero, animated: true)
        }
        
        if(resorts.count > 0 || articles.count > 0) {
            refreshLabel.isHidden = true
        }
        resortsCollectionView.reloadData()
        articlesTableView.reloadData()
    }
}


