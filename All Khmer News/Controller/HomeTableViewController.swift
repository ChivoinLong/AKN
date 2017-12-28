//
//  HomeTableViewController.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/25/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var articles = [Article]()
    
    var pagination: Pagination!
    
    var articlePresenter: ArticlePresenter?

}

// MARK: - Override Life Cycles
extension HomeTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlePresenter = ArticlePresenter()
        articlePresenter?.delegate = self
        
        let featuredCellNib = UINib(nibName: "FeaturedNewsCell", bundle: nil)
        tableView.register(featuredCellNib, forCellReuseIdentifier: "featuredCell")
        
        let newsCellNib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(newsCellNib, forCellReuseIdentifier: "newsCell")
        
        updateTableView()
    }
    
}

// MARK: - Adopt to ArticlePresenter
extension HomeTableViewController: ArticlePresenterProtocol {
    
    func didResponseArticles(articles: [Article], withPagination pagination: Pagination) {
        DispatchQueue.main.async {
            self.articles += articles
            self.pagination = pagination
            self.tableView.reloadData()
        }
        
    }
    
}

//MARK: - Updating tableView
extension HomeTableViewController {
    
    func updateTableView() {
        guard pagination != nil else {
            articlePresenter?.requestForArticles(atPage: 1, withLimitation: 15)
            return
        }
        
        guard pagination.page < pagination.totalPages else {
            return
        }
        articlePresenter?.requestForArticles(atPage: pagination.page + 1, withLimitation: 15)
//        print("update to page \(pagination.page)")
        
    }
    
}


// MARK: - Table view data source
extension HomeTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        (cell as! NewsCell).setData(article: articles[indexPath.item])
        
        if indexPath.item == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "featuredCell", for: indexPath)
        }
        
        print("count: \(articles.count)")
        
        return cell
    }
    
}


// MARK: - Table view delegate & show Detail
extension HomeTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == articles.count - 1 {
            updateTableView()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: articles[indexPath.item])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let destination = segue.destination as? DetailViewController {
                destination.article = sender as! Article
            }
        }
    }
    
}
