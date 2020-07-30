//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 30/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ video:Video) {
        self.video = video
        
        // Check cahced before downloading data
        if let cachedData = CacheManager.getVideoCached(self.video!.thumbnailURL) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        // set the image view
        let url = URL(string: video.thumbnailURL) ?? nil
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, err) in
            if err != nil || data == nil {
                return
            }
            
            // Save the data in cache
            CacheManager.setVideoCached(url!.absoluteString, data)
            
            // prevent reusable function of table view cell
            if url!.absoluteString != self.video?.thumbnailURL { return }
            
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.thumbnailImageView.image = image
            }
        
        }
        dataTask.resume()
        
        
        // set the title and date label
        self.titleLabel.text = video.title
    
        self.dateLabel.text = Constants.setDate(video.published)
    }
}
