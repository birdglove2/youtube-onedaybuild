//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 28/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import Foundation

struct Video : Decodable  {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnailURL = ""
    var published = Date()
    
    enum CodingKeys : String, CodingKey {
        
        //case items
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnailURL = "url"
        case videoId
    
    }
    
    init(from decoder: Decoder) throws {
        
        // Access snippet container in items array
        let container = try decoder.container(keyedBy: CodingKeys.self )
        //let itemsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .items)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse published
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
         
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse videoId but has to access resourceId container first
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
        // Parse thumbnailURL but has to access thumbnails container first
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnailURL =  try highContainer.decode(String.self, forKey: .thumbnailURL)
        
    }
}
