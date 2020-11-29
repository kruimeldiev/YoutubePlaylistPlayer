//
//  PlaylistController.swift
//  YoutubePlaylistViewer
//
//  Created by Casper Daris on 29/11/2020.
//

import UIKit

class PlaylistController: UIViewController {
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    var playlist = [VideoViewModel]() {
        didSet {
            playlistTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistTableView.dataSource = self
        playlistTableView.delegate = self

        self.fetchPlaylist()
    }
    
    // Functie om de playlist te downloaden
    func fetchPlaylist() {
        Service.getPlaylist { servicePlaylist in
            self.playlist = servicePlaylist.items.map({return VideoViewModel(video: $0)})
        }
    }
}

extension PlaylistController: UITableViewDataSource, UITableViewDelegate {
    
    // Deze functie bepaald hoeveel rows de TableView bevat
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        let video = playlist[indexPath.row]
        
        cell.makeCell(video: video)
        
        return cell
    }
    
    // Deze functie wordt uitgevoerd wanneer de gebruiker op een row klikt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
