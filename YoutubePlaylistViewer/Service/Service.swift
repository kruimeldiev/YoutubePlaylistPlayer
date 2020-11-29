//
//  Service.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import Foundation

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
                    let playlist = try JSONDecoder().decode(PlaylistModel.self, from: data!)
                    DispatchQueue.main.async {
                        completion(playlist)
                    }
                } catch {
                    print("Do-Catch error")
                }
            }
        }.resume()
    }
}
