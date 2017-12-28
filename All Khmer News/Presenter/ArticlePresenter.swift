//
//  ArticlePresenter.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/26/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

class ArticlePresenter {
    
    var delegate: ArticlePresenterProtocol?
    var articleService: ArticleService?
    
    init() {
        articleService = ArticleService()
        articleService?.delegate = self
    }
    
    func requestForArticles(atPage: Int, withLimitation: Int) {
        articleService?.requestForArticles(atPage: atPage, withLimitation: withLimitation)
    }
    
}

extension ArticlePresenter: ArticleServiceProtocol {
    
    func didResponseArticles(articles: [Article], withPagination pagination: Pagination) {
        self.delegate?.didResponseArticles(articles: articles, withPagination: pagination)
    }
    
}
