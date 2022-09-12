//
//  ViewController.swift
//  TestWorkMusicApp
//
//  Created by Mac on 3.09.22.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: -
    //MARK: UI
    
    @IBOutlet weak var table: UITableView!
    
    //MARK: -
    //MARK: Data
    private var songs: [Song] = []
    
    //MARK: -
    //MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureSongs()
    }
}

//MARK: -
//MARK: UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
    
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.font = UIFont(name: "Alone in a Room", size: 18)
        cell.textLabel?.font = UIFont(name: "Alone", size: 18)
        
        return cell
    }
    
}

//MARK: -
//MARK: UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
        //songs
        showPlayerScreen(songs: songs, position: indexPath.row)

    }
}

//MARK: -
//MARK: Transitions

private extension MainViewController {
    
    func showPlayerScreen(songs: [Song], position: Int) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    
}

//MARK: -
//MARK: Configure

private extension MainViewController {
    
    func configure() {
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs() {
        songs.append(Song(name: "Music Rock",
                          albumName: "Alone in a Room",
                          artistName: "Asking Aleksandria",
                          imageName: "cover2",
                          trackName: "Asking_Alexandria_Moving_On"))
        songs.append(Song(name: "BackGround Music",
                          albumName: "Someone Somewhere",
                          artistName: "Asking Aleksandria",
                          imageName: "cover3",
                          trackName: "Asking_Alexandria_Alone_In_A_Room"))
        songs.append(Song(name: "New Music",
                          albumName: "Alone Again",
                          artistName: "Asking Aleksandria",
                          imageName: "cover1",
                          trackName: "Asking_Alexandria_The_Black"))
        songs.append(Song(name: "Music Rock",
                          albumName: "Alone in a Room",
                          artistName: "Asking Aleksandria",
                          imageName: "cover2",
                          trackName: "Asking_Alexandria_Moving_On"))
        songs.append(Song(name: "BackGround Music",
                          albumName: "Someone Somewhere",
                          artistName: "Asking Aleksandria",
                          imageName: "cover3",
                          trackName: "Asking_Alexandria_Alone_In_A_Room"))
        songs.append(Song(name: "New Music",
                          albumName: "Alone Again",
                          artistName: "Asking Aleksandria",
                          imageName: "cover1",
                          trackName: "Asking_Alexandria_The_Black"))
        songs.append(Song(name: "Music Rock",
                          albumName: "Alone in a Room",
                          artistName: "Asking Aleksandria",
                          imageName: "cover2",
                          trackName: "Asking_Alexandria_Moving_On"))
        songs.append(Song(name: "BackGround Music",
                          albumName: "Someone Somewhere",
                          artistName: "Asking Aleksandria",
                          imageName: "cover3",
                          trackName: "Asking_Alexandria_Alone_In_A_Room"))
        songs.append(Song(name: "New Music",
                          albumName: "Alone Again",
                          artistName: "Asking Aleksandria",
                          imageName: "cover1",
                          trackName: "Asking_Alexandria_The_Black"))
    }
}


