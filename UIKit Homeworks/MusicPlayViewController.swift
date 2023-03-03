//
//  MusicPlayViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 14.03.2023.
//

import UIKit
import AVFoundation
import SwiftUI

class MusicPlayViewController: UIViewController {
    
    let songs = ["Location": "Playboi Carti", "Die Hard": "Kendrick Lamar", "Nikes On My Feet": "Mac Miller"]
    var queueSongs = [String]()
    var newQueueSongs:Dictionary<String, Int> = [:]
    var index = 0
    var nameSong: String = ""
    let nameSongLabel = UILabel()
    let autorSongLabel = UILabel()
    let albumLabel = UILabel()
    let nameAlbumLabel = UILabel()
    let songImageView = UIImageView()
    let musicSlider = UISlider()
    var player = AVAudioPlayer()
    let playButton = UIButton()
    let forwardButton = UIButton()
    let backwardButton = UIButton()
    let cancelButton = UIButton()
    let shareButton = UIButton()
    let likeButton = UIButton()
    let detailedButton = UIButton()
    var liked: Bool = false
    var timer = Timer()
    let startTimeLabel = UILabel()
    let endTimeLabel = UILabel()
    let repeatButton = UIButton()
    let randomButton = UIButton()
    var repeatBool = false
    var randomBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nameSongLabel.frame = CGRect(x: self.view.bounds.size.width/2, y: 440, width: 300, height: 100)
        nameSongLabel.center.x = self.view.center.x
        nameSongLabel.font = UIFont(name: "Arial-BoldMT", size: 25)
        nameSongLabel.text = nameSong
        nameSongLabel.textAlignment = .center
        view.addSubview(nameSongLabel)
        
        autorSongLabel.frame = CGRectMake(145, 470, 300, 100)
        autorSongLabel.center.x = self.view.center.x
        autorSongLabel.font = UIFont(name: "Arial-BoldMT", size: 16)
        autorSongLabel.text = songs[nameSong]
        autorSongLabel.textAlignment = .center
        autorSongLabel.textColor = .darkGray
        view.addSubview(autorSongLabel)
        
        let songImage = UIImage(named: nameSong + "Image")
        songImageView.frame = CGRect(x: 200, y: 110, width: 340, height: 340)
        songImageView.center.x = self.view.center.x
        songImageView.image = songImage
        songImageView.contentMode = .scaleAspectFill
        songImageView.layer.cornerRadius = 10
        songImageView.clipsToBounds = true
        view.addSubview(songImageView)
        
        albumLabel.frame = CGRectMake(145, 20, 300, 100)
        albumLabel.center.x = self.view.center.x
        albumLabel.text = "Playing from album"
        albumLabel.font = UIFont(name: "Arial", size: 15)
        albumLabel.textAlignment = .center
        albumLabel.textColor = .gray
        view.addSubview(albumLabel)
        
        nameAlbumLabel.frame = CGRectMake(145, 40, 300, 100)
        nameAlbumLabel.center.x = self.view.center.x
        nameAlbumLabel.text = "Album"
        nameAlbumLabel.font = UIFont(name: "Arial", size: 15)
        nameAlbumLabel.textAlignment = .center
        view.addSubview(nameAlbumLabel)
        
        playButton.frame = CGRectMake(145, 600, 70, 70)
        playButton.center.x = self.view.center.x
        var playImage = UIImage(systemName: "pause.fill")
        let targetSize = CGSize(width: 50, height: 50)
        playImage = playImage?.scalePreservingAspectRatio(targetSize: targetSize)
        playButton.setImage(playImage, for: .normal)
        playButton.imageView?.tintColor = .black
        playButton.addTarget(self, action: #selector(playMusic), for: .touchUpInside)
        view.addSubview(playButton)
        
        forwardButton.frame = CGRectMake(250, 600, 70, 70)
        var forwardImage = UIImage(systemName: "forward.end.fill")
        forwardImage = forwardImage?.scalePreservingAspectRatio(targetSize: targetSize)
        forwardButton.setImage(forwardImage, for: .normal)
        forwardButton.imageView?.tintColor = .black
        forwardButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        view.addSubview(forwardButton)
        
        backwardButton.frame = CGRectMake(70, 600, 70, 70)
        var backwardImage = UIImage(systemName: "backward.end.fill")
        backwardImage = backwardImage?.scalePreservingAspectRatio(targetSize: targetSize)
        backwardButton.setImage(backwardImage, for: .normal)
        backwardButton.imageView?.tintColor = .black
        backwardButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
        view.addSubview(backwardButton)
        
        musicSlider.frame = CGRectMake(0, 550, 340, 20)
        musicSlider.center.x = self.view.center.x
        musicSlider.minimumValue = 0
        musicSlider.tintColor = .systemGreen
        musicSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        view.addSubview(musicSlider)
        
        startTimeLabel.frame = CGRectMake(30, 530, 100, 20)
        startTimeLabel.text = "00:00"
        startTimeLabel.font = UIFont(name: "Arial", size: 15)
        startTimeLabel.textColor = .lightGray
        view.addSubview(startTimeLabel)
        
        endTimeLabel.frame = CGRectMake(330, 530, 100, 20)
        endTimeLabel.text = "00:00"
        endTimeLabel.font = UIFont(name: "Arial", size: 15)
        endTimeLabel.textColor = .lightGray
        view.addSubview(endTimeLabel)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        cancelButton.frame = CGRectMake(20, 60, 30, 30)
        var cancelImage = UIImage(systemName: "chevron.down")
        cancelImage = cancelImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
        cancelImage = cancelImage?.withRenderingMode(.alwaysTemplate)
        cancelButton.tintColor = .lightGray
        cancelButton.setImage(cancelImage, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
        shareButton.frame = CGRectMake(340, 60, 30, 30)
        var shareImage = UIImage(systemName: "square.and.arrow.up")
        shareImage = shareImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
        shareImage = shareImage?.withRenderingMode(.alwaysTemplate)
        shareButton.setImage(shareImage, for: .normal)
        shareButton.tintColor = .lightGray
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        view.addSubview(shareButton)
        
        likeButton.frame = CGRectMake(20, 475, 30, 30)
        var heartImage = UIImage(systemName: "heart")
        heartImage = heartImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
        heartImage = heartImage?.withRenderingMode(.alwaysTemplate)
        likeButton.setImage(heartImage, for: .normal)
        likeButton.tintColor = .lightGray
        likeButton.addTarget(self, action: #selector(likeSong), for: .touchUpInside)
        view.addSubview(likeButton)
        
        detailedButton.frame = CGRectMake(330, 475, 30, 30)
        var ellipsis = UIImage(systemName: "ellipsis")
        ellipsis = ellipsis?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
        ellipsis = ellipsis?.withRenderingMode(.alwaysTemplate)
        detailedButton.setImage(ellipsis, for: .normal)
        detailedButton.tintColor = .lightGray
        view.addSubview(detailedButton)
        
        repeatButton.frame = CGRectMake(335, 620, 30, 30)
        var repeatImage = UIImage(systemName: "repeat")
        repeatImage = repeatImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
        repeatImage = repeatImage?.withRenderingMode(.alwaysTemplate)
        repeatButton.setImage(repeatImage, for: .normal)
        repeatButton.addTarget(self, action: #selector(repeatAction), for: .touchUpInside)
        repeatButton.tintColor = .lightGray
        view.addSubview(repeatButton)
        
        randomButton.frame = CGRectMake(30, 620, 30, 30)
        var shuffleImage = UIImage(systemName: "shuffle")
        shuffleImage = shuffleImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
        shuffleImage = shuffleImage?.withRenderingMode(.alwaysTemplate)
        randomButton.setImage(shuffleImage, for: .normal)
        randomButton.tintColor = .lightGray
        randomButton.addTarget(self, action: #selector(randomAction), for: .touchUpInside)
        view.addSubview(randomButton)
        
        let audioPath = Bundle.main.path(forResource: nameSong, ofType: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            musicSlider.maximumValue = Float(player.duration)
        } catch {
            print("error")
        }
        player.play()
        
        for (index, item) in queueSongs.enumerated() {
            newQueueSongs[item] = index
        }
        
    }
    
    @objc func changeSlider(ParametrSender: UISlider) {
        player.currentTime = TimeInterval(ParametrSender.value)
    }
    
    @objc func playMusic(ParametrSender: UIButton) {
        let targetSize = CGSize(width: 50, height: 50)
        if player.isPlaying {
            player.pause()
            var playImage = UIImage(systemName: "play.fill")
            playImage = playImage?.scalePreservingAspectRatio(targetSize: targetSize)
            ParametrSender.setImage(playImage, for: .normal)
        } else {
            player.play()
            var pauseImage = UIImage(systemName: "pause.fill")
            pauseImage = pauseImage?.scalePreservingAspectRatio(targetSize: targetSize)
            ParametrSender.setImage(pauseImage, for: .normal)
        }
    }
    
    @objc func cancel(ParametrSender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func likeSong(ParametrSender: UIButton) {
        if liked == false {
            var heartFillImage = UIImage(systemName: "heart.fill")
            heartFillImage = heartFillImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
            heartFillImage = heartFillImage?.withRenderingMode(.alwaysTemplate)
            ParametrSender.setImage(heartFillImage, for: .normal)
            ParametrSender.tintColor = .systemGreen
            liked = true
        } else {
            var heartImage = UIImage(systemName: "heart")
            heartImage = heartImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
            heartImage = heartImage?.withRenderingMode(.alwaysTemplate)
            ParametrSender.setImage(heartImage, for: .normal)
            ParametrSender.tintColor = .lightGray
            liked = false
        }
    }
    
    @objc func updateTime() {
        let timePlayed = player.currentTime
        let minuteStart = Int(timePlayed / 60)
        let secondStart = Int(timePlayed.truncatingRemainder(dividingBy: 60))
        startTimeLabel.text = String(format: "%02d:%02d", minuteStart, secondStart)
        
        let endTime = player.currentTime - player.duration
        let minutEnd = Int(endTime / 60)
        let secondEnd = -Int(endTime.truncatingRemainder(dividingBy: 60))
        endTimeLabel.text = String(format: "%02d:%02d", minutEnd, secondEnd)
    }
    
    @objc func nextSong(ParametrSender: UIButton) {
        if newQueueSongs[nameSong] != 2 && ParametrSender == forwardButton && repeatBool == false {
            nameSong = queueSongs[newQueueSongs[nameSong]! + 1]
        } else if newQueueSongs[nameSong] != 0 && ParametrSender == backwardButton && repeatBool == false {
            nameSong = queueSongs[newQueueSongs[nameSong]! - 1]
        } else if randomBool == true && repeatBool == false {
            nameSong = queueSongs.randomElement()!
        }
        nameSongLabel.text = nameSong
        autorSongLabel.text = songs[nameSong]
        let songImage = UIImage(named: nameSong + "Image")
        songImageView.image = songImage
        
        let audioPath = Bundle.main.path(forResource: nameSong, ofType: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            musicSlider.maximumValue = Float(player.duration)
        } catch {
            print("error")
        }
        player.play()
    }
    
    @objc func repeatAction(ParametrSender: UIButton) {
        if repeatBool == false {
            ParametrSender.tintColor = .systemGreen
            repeatBool = true
        } else {
            ParametrSender.tintColor = .lightGray
            repeatBool = false
        }
    }
    
    @objc func randomAction(ParametrSender: UIButton) {
        if randomBool == false {
            randomButton.tintColor = .systemGreen
            randomBool = true
        } else {
            randomButton.tintColor = .lightGray
            randomBool = false
        }
    }

    @objc func share(ParametrSender: UIButton) {
        let activityViewController = UIActivityViewController(activityItems: ["Liked song", nameSong, songs[nameSong]], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true)
    }
}

struct MusicPlayViewControllerContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MusicPlayViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        return MusicPlayViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct MusicPlayViewController_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayViewControllerContainerView().colorScheme(.light) // or .dark
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
