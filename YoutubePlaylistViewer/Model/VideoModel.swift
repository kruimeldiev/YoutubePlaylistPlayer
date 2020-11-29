//
//  VideoModel.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import Foundation

struct VideoModel: Decodable {
    
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var publishDate: Date
    
    enum VideoModelCodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case videoId
        case title
        case description
        case thumbnail = "url"
        case publishDate = "publishedAt"
    }
    
    init(from decoder: Decoder) throws {
        
        // Deze container is alles wat in de 'items' dictionairy zit van de JSON data (check PlaylistModel)
        let container = try decoder.container(keyedBy: VideoModelCodingKeys.self)
        
        // Binnen container zitten vier andere nested containers
        // Deze containers worden hieronder gedecoded
        let snippetContainer = try container.nestedContainer(keyedBy: VideoModelCodingKeys.self, forKey: .snippet)
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: VideoModelCodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: VideoModelCodingKeys.self, forKey: .high)
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: VideoModelCodingKeys.self, forKey: .resourceId)
        
        // Alle variabelen van de video instellen
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.publishDate = try snippetContainer.decode(Date.self, forKey: .publishDate)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
    
}
