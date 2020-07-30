//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Krittamook Aksornchindarat on 30/7/2563 BE.
//  Copyright © 2563 Krittamook Aksornchindarat. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var video:Video?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        guard video != nil else {
            return
        }
        
        // set title
        self.titleLabel.text = video!.title
        
        // set date
        self.dateLabel.text = Constants.setDate(video!.published)
        
        // set web view
        let embedURLString = Constants.YOUTUBE_EMBEDED_URL + video!.videoId
        let url = URL(string: embedURLString)
        let request = URLRequest(url: url!)
        self.webView.load(request)
        
        // set description
        self.descriptionText.text = video!.description
        
    }
    
    func getVideoDetail() {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
