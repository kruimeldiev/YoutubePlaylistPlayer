//
//  VideoCell.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import UIKit

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func makeCell(video: VideoViewModel) {
        self.titleLabel.text = video.title
        print("Video Cell gemaakt voor: \(video.title)")
    }
}
