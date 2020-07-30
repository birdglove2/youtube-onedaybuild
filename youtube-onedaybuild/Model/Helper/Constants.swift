//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 28/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyCCpITqhGyoZTXTJ_gwkDmL5KRaNd3m7uo"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
   // static var DATE_FORMAT = "EEEE, MMM d, yyyy"
    static var YOUTUBE_EMBEDED_URL = "https://www.youtube.com/embed/"
    
    static func setDate(_ date:Date) -> String{
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        
        return df.string(from: date)
    }
}
