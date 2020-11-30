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
            // Dankzij deze didSet methode wordt de playlistTableView ververst iedere keer wanneer de data van de playlist wordt aangepast
            playlistTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Playlist"
        
        // Hier wordt de dataSource van de TableView ingesteld
        // Omdat de extension van de PlaylistViewController een UITableViewDataSource is, kun je deze als self instellen
        playlistTableView.dataSource = self
        
        // Instellen van de delegate van de TableView
        // De delegate regelt alle user interactions in de TableView
        playlistTableView.delegate = self

        self.fetchPlaylist()
    }
    
    // Deze functie wordt aangeroepen wanneer de VideoView wordt geopent
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Controlleren of er een row is geselecteerd
        guard playlistTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let geselecteerdeVideo = playlist[playlistTableView.indexPathForSelectedRow!.row]
        
        let videoVC = segue.destination as! VideoController
        
        videoVC.video = geselecteerdeVideo
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
    
    // Deze functie bepaald wat de data is die in iedere row van de TableView weergegeven wordt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        
        // De data (video) ophalen om in de cell te plaatsen
        let video = playlist[indexPath.row]
        
        // VideoCell maken met de video
        cell.makeCell(video: video)
        
        return cell
    }
    
}
