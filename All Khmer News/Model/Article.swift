//
//  Article.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/25/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    var list: [Article]
    var pagination: Pagination
    
    enum CodingKeys: String, CodingKey {
        case list = "DATA"
        case pagination = "PAGINATION"
    }
    
    init(from decoder: Decoder) throws {
        let articleValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.list = try articleValues.decode([Article].self, forKey: .list)
        self.pagination = try articleValues.decode(Pagination.self, forKey: .pagination)
    }
}

struct Article: Codable {
    var id: Int
    var title: String?
    var description: String?
    var createdDate: Date
    var author: Author
    var status: String
    var category: Category
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "TITLE"
        case description = "DESCRIPTION"
        case createdDate = "CREATED_DATE"
        case author = "AUTHOR"
        case status = "STATUS"
        case category = "CATEGORY"
        case image = "IMAGE"
    }
    
    init(from decoder: Decoder) throws {
        let articleValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try articleValues.decode(Int.self, forKey: .id)
        self.title = try articleValues.decodeIfPresent(String.self, forKey: .title)
        self.description = try articleValues.decodeIfPresent(String.self, forKey: .description)
        self.createdDate = try articleValues.decode(Date.self, forKey: .createdDate)
        self.author = try articleValues.decode(Author.self, forKey: .author)
        self.status = try articleValues.decode(String.self, forKey: .status)
        self.category = try articleValues.decode(Category.self, forKey: .category)
        self.image = try articleValues.decodeIfPresent(String.self, forKey: .image)
    }
    
}


extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHmmss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
