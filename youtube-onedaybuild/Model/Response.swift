//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 29/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items:[Video]?
    
    enum CodingKeys : String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
        print("item")
    }
}

