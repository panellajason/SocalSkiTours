//
//  NewsViewController.swift
//  BCLog
//
//  Created by Jason Panella on 12/1/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var resortsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        
        
        //resortsTableView.dataSource = self
        //resortsTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = SFSafariViewController(url: URL(string: DatabaseService.newsArticles[indexPath.row].url)!)
        present(vc, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DatabaseService.newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as! NewsTableViewCell
        newsCell.configure(with: DatabaseService.newsArticles[indexPath.row])
        return newsCell
        
//        if tableView == firstTableView,
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomOne") as? CustomOneTableViewCell {
//            return cell
//        } else if tableView == autoSuggestTableView,
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTwo") as? CustomTwoTableViewCell {
//            return cell
//        }
//
//        return UITableViewCell()
    }

    
}


