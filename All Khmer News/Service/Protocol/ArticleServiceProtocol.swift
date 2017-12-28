//
//  ArticleServiceProtocol.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/26/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

protocol ArticleServiceProtocol {
    
    func didResponseArticles(articles: [Article], withPagination pagination: Pagination)
    
}
