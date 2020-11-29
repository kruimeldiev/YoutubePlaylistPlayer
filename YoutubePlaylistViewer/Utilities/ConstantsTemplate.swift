//
//  ConstantsTemplate.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import Foundation

struct ConstantsTemplate {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(ConstantsTemplate.PLAYLIST_ID)&key=\(ConstantsTemplate.API_KEY)"
    
}
