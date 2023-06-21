//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

final class NewsFeedViewController: UIViewController {

    private var newsFeedTableView = UITableView()
    private var refreshControl = UIRefreshControl()
    
    let stories = [
        Story(name: "1", preview: "1"),
        Story(name: "ruskibeast", preview: "ruskibeast"),
        Story(name: "ba1zhina", preview: "ba1zhina"),
        Story(name: "antonerend", preview: "antonerend"),
        Story(name: "ruslanonly", preview: "ruslanonly"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1"),
        Story(name: "1", preview: "1")
    ]
    
    let usersPublications = [
        Publication(userName: "ba1zhina",
                    namePhotos: ["ba1zhina_1", "ba1zhina_2"],
                    likes: 50,
                    signature: "la baguette, le croissant, leclerc 👄",
                    date: "5 апреля"),
        Publication(userName: "ruskibeast",
                    namePhotos: ["ruskibeast_1", "ruskibeast_2", "ruskibeast_3"],
                    likes: 43,
                    signature: "Hairstyle bro",
                    date: "7 октября 2022 г."),
        Publication(userName: "antonerend",
                    namePhotos: ["antonerend_1"],
                    likes: 25,
                    signature: "мы друзья.",
                    date: "11 августа 2021 г."),
        Publication(userName: "ruslanonly",
                    namePhotos: ["ruslanonly_1"],
                    likes: 11,
                    signature: "Просто друзья",
                    date: "22 января"),
        Publication(userName: "ba1zhina",
                    namePhotos: ["ba1zhina_3", "ba1zhina_4"],
                    likes: 53,
                    signature: "nothing, just an incident on the race",
                    date: "22 февраля"),
        Publication(userName: "ba1zhina",
                    namePhotos: ["ba1zhina_3", "ba1zhina_4"],
                    likes: 53,
                    signature: "nothing, just an incident on the race",
                    date: "22 февраля")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupNavigationBar()
        
        newsFeedTableView = UITableView(frame: view.bounds, style: .plain)
        newsFeedTableView.backgroundColor = .black
        newsFeedTableView.register(PublicationTableViewCell.self, forCellReuseIdentifier: "post")
        newsFeedTableView.register(StoriesForNewsFeedTableViewCell.self, forCellReuseIdentifier: "stories")
        newsFeedTableView.register(UITableViewCell.self, forCellReuseIdentifier: "recommendation")
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        newsFeedTableView.showsVerticalScrollIndicator = false
        view.addSubview(newsFeedTableView)
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        newsFeedTableView.refreshControl = refreshControl
    }
    
    private func setupNavigationBar() {
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "message")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                style: .plain, target: self, action: nil),
            UIBarButtonItem(
                image: UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                style: .plain, target: self, action: #selector(presentNotificationsViewController))
        ]
        
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        navigationController?.hidesBarsOnSwipe = true
    }

    @objc func refresh(refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
    }
    
    @objc func presentNotificationsViewController() {
        let notificationsViewController = NotificationsViewController()
        navigationController?.pushViewController(notificationsViewController, animated: true)
    }
}

extension NewsFeedViewController: UITableViewDelegate {
    
}

extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersPublications.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "stories", for: indexPath
                ) as! StoriesForNewsFeedTableViewCell
                cell.selectionStyle = .none
                cell.configure(with: stories)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "post", for: indexPath
                ) as! PublicationTableViewCell
                cell.selectionStyle = .none
                cell.configure(with: usersPublications[indexPath.row - 1])
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
            case 0:
                return 115
            default:
                return 650
        }
    }
    

}
