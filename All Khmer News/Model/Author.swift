//
//  Author.swift
//  All Khmer News
//
//  Created by Obi-Voin Kenobi on 12/25/17.
//  Copyright © 2017 Obi-Voin Kenobi. All rights reserved.
//

import Foundation

struct Author: Codable {
    var id: Int
    var name: String?
    var gender: String?
    var telephone: String?
    var status: String?
    var facebookId: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "NAME"
        case gender = "GENDER"
        case telephone = "TELEPHONE"
        case status = "STATUS"
        case facebookId = "FACEBOOK_ID"
        case imageUrl = "IMAGE_URL"
    }
    
    
    
    init (from decoder: Decoder) throws {
        let authorValues = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try authorValues.decode(Int.self, forKey: .id)
        self.name = try authorValues.decodeIfPresent(String.self, forKey: .name)
        self.gender = try authorValues.decodeIfPresent(String.self, forKey: .gender)
        self.telephone = try authorValues.decodeIfPresent(String.self, forKey: .telephone)
        self.status = try authorValues.decodeIfPresent(String.self, forKey: .status)
        self.facebookId = try authorValues.decodeIfPresent(String.self, forKey: .facebookId)
        self.imageUrl = try authorValues.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}
