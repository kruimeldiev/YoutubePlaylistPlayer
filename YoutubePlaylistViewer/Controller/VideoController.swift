//
//  VideoController.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 30/11/2020.
//

import UIKit
import WebKit

class VideoController: UIViewController {

    @IBOutlet weak var videoView: WKWebView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descView: UITextView!
    
    var video: VideoViewModel? {
        didSet {
            title = video?.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeVideoView()
    }

    func makeVideoView() {
        
        guard video != nil else {
            return
        }
        
        let url = URL(string: Constants.YT_EMBED_URL + video!.videoId)
        let request = URLRequest(url: url!)
        videoView.load(request)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateLabel.text = dateFormatter.string(from: video!.publishDate)
        
        descView.text = video!.description
        
    }
}
