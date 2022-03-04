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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if DatabaseService.skiResorts.count == 0 || DatabaseService.newsArticles.count == 0 || articles.count == 0 || resorts.count == 0 {
            self.showSpinner(onView: self.view)
            fetchData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.removeSpinner()
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
        let vc = SFSafariViewController(url: URL(string: resorts[indexPath.row].url)!)
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
        let vc = SFSafariViewController(url: URL(string: articles[indexPath.row].url)!)
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

        if articles.count == 0 || resorts.count == 0 {
            fetchData()
        } else {
            if articles.count != 0 {
                self.articlesTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
            if resorts.count != 0 {
                resortsCollectionView.setContentOffset(.zero, animated: true)
            }
        }
    }
    
    private func fetchData() {
        DatabaseService.getResortForecast { [weak self] resortsData in
            DatabaseService.getArticles { [weak self] articlesData in
                
                self?.resorts = resortsData ?? [Resort]()
                self?.articles = articlesData ?? [Article]()
                DispatchQueue.main.async {
                   self?.articlesTableView.reloadData()
                   self?.resortsCollectionView.reloadData()
                   self?.removeSpinner()
                }
            }
        }
    }
    
}


