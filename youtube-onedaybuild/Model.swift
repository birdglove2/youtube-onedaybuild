//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 28/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import Foundation

class Model {
    
    init(){
        
    }
    
    func getVideos() {
        
        print("KKKKKKKKKKKKKKKKKKKKKKKKKK")
        // Create a URL object
        let url = URL(string: Constants.API_URL) ?? nil
        
        guard url != nil else {
            return
        }
        
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from a URLSession
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any error
            if error != nil || data == nil {
                return
            }
            
            // Parsing the data into video objects
        }
        
        // Kick off the task
        dataTask.resume()
        print("xxxxxxxxxxx")
        
    }
}
