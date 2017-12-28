//
//  ArticleService.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/25/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

class ArticleService {
    
    var delegate: ArticleServiceProtocol?
    
    var url = URL(string: "http://api-ams.me/v1/api/articles?")!
    var request: URLRequest!
    
    init() {
        request = URLRequest(url: url)
        request.setValue("Basic QU1TQVBJQURNSU46QU1TQVBJUEBTU1dPUkQ=", forHTTPHeaderField: "Authorization")
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    }
    
}


// MARK: - GET All Article
extension ArticleService {
    
    func requestForArticles(atPage: Int, withLimitation: Int) {
        request.url = URL(string: "\(url)page=\(atPage)&limit=\(withLimitation)")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let jsonData = data else {
                return
            }
        
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            do {
                let articles = try decoder.decode(ArticleList.self, from: jsonData)
                self.delegate?.didResponseArticles(articles: articles.list, withPagination: articles.pagination)
                print("success: \(articles.pagination)")
            } catch {
                print("error decode")
            }
            
        }.resume()
    }
    
}


extension ArticleService {
    
    func uploadImage(<#parameters#>) -> <#return type#> {
        <#function body#>
    }
    
}
