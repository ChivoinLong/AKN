//
//  Category.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/25/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

struct Category: Codable {
    var id: Int
    var name: String?

    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "NAME"
    }
    
    
    init (from decoder: Decoder) throws {
        let categoryValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try categoryValues.decode(Int.self, forKey: .id)
        self.name = try categoryValues.decodeIfPresent(String.self, forKey: .name)
    }
}
