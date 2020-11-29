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
        
        // Thumbnail van de VideoCell instellen
        Service.getThumbnail(video: video) { thumbnail in
            self.thumbnailView.image = thumbnail
        }
        
        // TitleLabel van de VideoCell instellen
        self.titleLabel.text = video.title
        
        // DateLabel van de VideoCell instellen
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        self.dateLabel.text = dateFormatter.string(from: video.publishDate)
    }
}
