//
//  Pagination.swift
//  All Khmer News
//
//  Created by LongChivoin on 12/27/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

struct Pagination: Decodable {
    
    var page: Int
    var limit: Int
    var totalCount: Int
    var totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "PAGE"
        case limit = "LIMIT"
        case totalCount = "TOTAL_COUNT"
        case totalPages = "TOTAL_PAGES"
    }

    init(from decoder: Decoder) throws {
        let paginationValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.page = try paginationValues.decode(Int.self, forKey: .page)
        self.limit = try paginationValues.decode(Int.self, forKey: .limit)
        self.totalCount = try paginationValues.decode(Int.self, forKey: .totalCount)
        self.totalPages = try paginationValues.decode(Int.self, forKey: .totalPages)
    }
}
