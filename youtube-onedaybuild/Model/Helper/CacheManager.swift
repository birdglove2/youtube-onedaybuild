//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 30/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import Foundation

struct CacheManager {
    
    static var cache = [String:Data]()
    static func setVideoCached(_ url: String, _ data:Data?) {
        
        cache[url] = data
        
    
    }
    
    static func getVideoCached(_ url: String) -> Data? {
        
        return cache[url]
        
    }
}
