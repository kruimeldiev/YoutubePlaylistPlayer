//
//  Service.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import SwiftUI

struct Service {
    
    static func getPlaylist(completion: @escaping(PlaylistModel) -> ()) {
        
        guard let url = URL(string: Constants.API_URL) else {
            print("API URL niet beschikbaar")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print(error!)
                return
            }
            
            if data != nil {
                do {
                    // Deze dateDecodingStrategy is nodig om de String (publishedAt) van de API om te zetten naar een Date voor de Model
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    // JSON parsing
                    let playlist = try decoder.decode(PlaylistModel.self, from: data!)
                    
                    // PlaylistModel doorsturen met gebruik van de CompletionHandler
                    DispatchQueue.main.async {
                        completion(playlist)
                    }
                } catch {
                    print("Error tijdens JSON parsing van de playlist")
                    print(error)
                }
            }
        }.resume()
    }
    
    static func getThumbnail(video: VideoViewModel, completion: @escaping(UIImage) -> ()) {
        
        var thumbnail = UIImage(systemName: "photo")
        
        // Controlleren of de data al in de cache zit
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            print("Thumbnail weergegeven uit cache")
            thumbnail = UIImage(data: cachedData)
            return
        }
        
        guard let url = URL(string: video.thumbnail) else {
            print("Geen thumbnail beschikbaar voor: \(video.title)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if error != nil {
                print("Error bij downlaoden van thumbnail voor: \(video.title)")
            }
            
            if data != nil {
                
                DispatchQueue.main.async {
                    // Data in cache opslaan
                    CacheManager.setVideoCache(video.thumbnail, data!)
                    print("Thumbnail gedownload uit API")
                    // thumbnail doorsturen met behulp van Completion Handler
                    thumbnail = UIImage(data: data!)
                    completion(thumbnail!)
                }
            }
        }.resume()
    }
}
