//
//  VideoViewModel.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import Foundation

struct VideoViewModel {
    
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var publishDate: Date
    
    init(video: VideoModel) {
        self.videoId = video.videoId
        self.title = video.title
        self.description = video.description
        self.thumbnail = video.thumbnail
        self.publishDate = video.publishDate
        print("VideoViewModel gemaakt voor: \(video.title)")
    }
    
}
