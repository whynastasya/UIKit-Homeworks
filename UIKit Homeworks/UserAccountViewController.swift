//
//  UserAccountViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 11.05.2023.
//

import UIKit

final class UserAccountViewController: UIViewController {

    private let userAccountTableView = UITableView()
    private var refreshControl = UIRefreshControl()
    
    private var user = User(
        userName: "cat",
        name: "котичка",
        avatar: "1",
        publications: [Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232"),
                       Publication(namePhotos: ["1"], likes: 23, signature: "sddsds", date: "232")],
        followersCount: "24",
        followingCount: "54",
        commonFollowers: "ba1zhina, ruslanonly",
        signature: "meow meow meow MEOOOOOOW😼😼😼😼",
        stories: [Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1"),
                  Story(name: "cat", preview: "1")]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUserAccountTableView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = user.userName
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "ellipsis")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "bell")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil)
        ]
    }
    
    private func setupUserAccountTableView() {
        userAccountTableView.frame = view.bounds
        userAccountTableView.dataSource = self
        userAccountTableView.delegate = self
        userAccountTableView.register(UserBioTableViewCell.self, forCellReuseIdentifier: "UserBio")
        userAccountTableView.register(PublicationsHeaderTableViewCell.self, forCellReuseIdentifier: "Header")
        userAccountTableView.register(StoriesForUserAccountTableViewCell.self, forCellReuseIdentifier: "Stories")
        userAccountTableView.register(PublicationsTableViewCell.self, forCellReuseIdentifier: "Publications")
        view.addSubview(userAccountTableView)
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        userAccountTableView.refreshControl = refreshControl
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
    }
}

extension UserAccountViewController: UITableViewDelegate {
    
}

extension UserAccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserBio") as! UserBioTableViewCell
                cell.selectionStyle = .none
                cell.configure(user: user)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Stories") as! StoriesForUserAccountTableViewCell
                cell.configure(with: user.stories)
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Header") as! PublicationsHeaderTableViewCell
                cell.selectionStyle = .none
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Publications") as! PublicationsTableViewCell
                cell.publications = user.publications
                cell.selectionStyle = .none
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 240
            case 1:
                return 115
            case 2 :
                return 40
            case 3:
                let heightForPublicationsRow = Constants.userPublicationDimension * CGFloat(user.publications.count / 3) + 300
                return heightForPublicationsRow
            default:
                return 0
        }
    }
}
