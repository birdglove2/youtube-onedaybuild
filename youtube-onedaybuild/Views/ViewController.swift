//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 28/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    var videos = [Video]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        model.modelDelagate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check if a video actually was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference from video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        // Parse the video reference to DetailViewController
        let detailVC:DetailViewController = segue.destination as! DetailViewController
        detailVC.video = selectedVideo
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellPrototype", for: indexPath) as! VideoTableViewCell
        
        
        cell.setCell(self.videos[indexPath.row])
        //cell.textLabel?.text = self.videos[indexPath.row].title
        
       
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //
    }
    
}

extension ViewController: ModelProtocol {
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
}

