//
//  CacheManager.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import Foundation

class CacheManager {
    
    static var cacheDict = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data) {
        
        // Data opslaan met de url als key
        cacheDict[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // Return de data bij de passende url key, als deze niet is gevonden: return nil
        return cacheDict[url]
    }
}
