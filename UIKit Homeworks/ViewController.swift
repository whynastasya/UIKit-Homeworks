//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit
import AVFoundation
import SwiftUI

class ViewController: UIViewController {
    
    let songs = ["Location": "Playboi Carti", "Die Hard": "Kendrick Lamar", "Nikes On My Feet": "Mac Miller"]
    var queueSongs = [String]()
    let player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.title = "Playlist"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial-BoldMT", size: 27)]

        var number = 1
        for (key, value) in songs {
            createButton(name: key, autor: value, number: number)
            number += 1
        }
        print(queueSongs)
    }
    
    func createButton(name: String, autor: String, number: Int) {
        let songButton = UIButton()
        let nameSongLabel = UILabel()
        let autorSongLabel = UILabel()
        let songImage = UIImage(named: name + "Image")
        let songImageView = UIImageView()
        let timeLabel = UILabel()
        var player = AVAudioPlayer()
        
        queueSongs.append(name)
        
        switch number {
        case 1:
            songButton.frame = CGRectMake(0, 100, 400, 100)
            nameSongLabel.frame = CGRectMake(120, 105, 200, 50)
            autorSongLabel.frame = CGRectMake(120, 135, 200, 50)
            songImageView.frame = CGRectMake(20, 110, 80, 80)
            timeLabel.frame = CGRectMake(330, 120, 100, 20)
        case 2:
            songButton.frame = CGRectMake(0, 199, 400, 100)
            nameSongLabel.frame = CGRectMake(120, 205, 200, 50)
            autorSongLabel.frame = CGRectMake(120, 235, 200, 50)
            songImageView.frame = CGRectMake(20, 210, 80, 80)
            timeLabel.frame = CGRectMake(330, 220, 100, 20)
        case 3:
            songButton.frame = CGRectMake(0, 298, 400, 100)
            nameSongLabel.frame = CGRectMake(120, 305, 200, 50)
            autorSongLabel.frame = CGRectMake(120, 335, 200, 50)
            songImageView.frame = CGRectMake(20, 310, 80, 80)
            timeLabel.frame = CGRectMake(330, 320, 100, 20)
        default:
            return
        }
        
        songButton.layer.borderWidth = 1
        songButton.layer.borderColor = UIColor.lightGray.cgColor
        songButton.setTitle(name, for: .normal)
        songButton.addTarget(self, action: #selector(chooseSongButton), for: .touchUpInside)
        view.addSubview(songButton)
        
        nameSongLabel.text = name
        nameSongLabel.font = UIFont(name: "Arial-BoldMT", size: 20)
        view.addSubview(nameSongLabel)
        
        autorSongLabel.text = autor
        autorSongLabel.textColor = .darkGray
        autorSongLabel.font = UIFont(name: "Arial", size: 17)
        view.addSubview(autorSongLabel)
        
        songImageView.image = songImage
        songImageView.contentMode = .scaleAspectFill
        songImageView.layer.cornerRadius = 3
        songImageView.clipsToBounds = true
        view.addSubview(songImageView)
        
        let audioPath = Bundle.main.path(forResource: name, ofType: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            print("error")
        }
        
        let minute = Int(player.duration / 60)
        let second = Int(player.duration.truncatingRemainder(dividingBy: 60))
        
        
        timeLabel.text = String(format: "%02d:%02d", minute, second)
        timeLabel.font = UIFont(name: "Arial", size: 16)
        timeLabel.textColor = .lightGray
        view.addSubview(timeLabel)
    }
    
    @objc func chooseSongButton(ParametrSender: UIButton) {
        let secondViewController = MusicPlayViewController()
        secondViewController.nameSong = (ParametrSender.titleLabel?.text)!
        secondViewController.queueSongs = queueSongs
        navigationController?.present(secondViewController, animated: true)
    }
}



struct ViewControllerContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerContainerView().colorScheme(.light) // or .dark
    }
}
