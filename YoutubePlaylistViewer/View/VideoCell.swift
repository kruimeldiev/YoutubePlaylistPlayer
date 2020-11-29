//
//  VideoCell.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import UIKit

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func makeCell(video: VideoViewModel) {
        
        Service.getThumbnail(video: video) { thumbnail in
            self.thumbnailView.image = thumbnail
        }
        self.titleLabel.text = video.title
        self.dateLabel.text = video.publishDate
    }
}
