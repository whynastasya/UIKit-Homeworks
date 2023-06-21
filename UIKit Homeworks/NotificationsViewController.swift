//
//  NotificationsViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.05.2023.
//

import UIKit

final class NotificationsViewController: UIViewController {

    private var notificationsTableView = UITableView()
    
    private var notifications = [
        //today
        [Notification(
            type: .like,
            user: User(userName: "ba1zhina",avatar: "ba1zhina"),
            publicationName: "1",
            date: "12 мин.",
            section: .today),
        Notification(
            type: .like,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            date: "23 мин.",
            section: .today),
        Notification(
            type: .comment,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            comment: "'ляляляляля'",
            date: "1 ч.",
            section: .today),
        Notification(
            type: .subscription,
            user: User(userName: "antonerend", avatar: "antonerend"),
            date: "2 ч.",
            section: .today),
        Notification(
            type: .comment,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            comment: "'👀'",
            date: "3 ч.",
            section: .today),
        Notification(
            type: .subscription,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            date: "4 ч.",
            section: .today),
        Notification(
            type: .subscription,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            date: "8 ч.",
            section: .today),
        Notification(
            type: .comment,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            publicationName: "1",
            comment: "'😂😂😂😂😂'",
            date: "8 ч.",
            section: .today),
        Notification(
            type: .subscription,
            user: User(userName: "antonerend", avatar: "antonerend"),
            date: "12 ч.",
            section: .today),
        Notification(
            type: .like,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            publicationName: "1",
            date: "16 ч.",
            section: .today)],
        //week
        [Notification(
            type: .like,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            date: "Вчера",
            section: .week),
        Notification(
            type: .like,
            user: User(userName: "ba1zhina", avatar: "ba1zhina"),
            publicationName: "1",
            date: "Вчера",
            section: .week),
        Notification(
            type: .subscription,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            date: "2 дня",
            section: .week),
        Notification(
            type: .like,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            publicationName: "1",
            date: "3 дня",
            section: .week),
        Notification(
            type: .comment,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            comment: "'😋😉😉'",
            date: "4 дня",
            section: .week),
        Notification(
            type: .like,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            date: "4 дня",
            section: .week),
        Notification(
            type: .subscription,
            user: User(userName: "antonerend", avatar: "antonerend"),
            date: "5 дн.",
            section: .week),
        Notification(
            type: .like,
            user: User(userName: "ba1zhina", avatar: "ba1zhina"),
            publicationName: "1",
            date: "5 дн.",
            section: .week),
        Notification(
            type: .comment,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            publicationName: "1",
            comment: "'мяу мяу мяу мяу мяу'",
            date: "1 нед.",
            section: .week),
        Notification(
            type: .subscription,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            date: "1 нед.",
            section: .week),
        Notification(
            type: .subscription,
            user: User(userName: "ba1zhina", avatar: "ba1zhina"),
            date: "1 нед.",
            section: .week)],
        //month
        [Notification(
            type: .like,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            publicationName: "1",
            date: "4 мая",
            section: .month),
        Notification(
            type: .subscription,
            user: User(userName: "antonerend", avatar: "antonerend"),
            date: "7 мая",
            section: .month),
        Notification(
            type: .like,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            date: "8 мая",
            section: .month),
        Notification(
            type: .comment,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            comment: "'😹😹😹😹😹😹'",
            date: "10 мая",
            section: .month),
        Notification(
            type: .like,
            user: User(userName: "ba1zhina", avatar: "ba1zhina"),
            publicationName: "1",
            date: "10 мая",
            section: .month),
        Notification(
            type: .comment,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            comment: "'ыааыаыаыаы'",
            date: "10 мая",
            section: .month),
        Notification(
            type: .subscription,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            date: "11 мая",
            section: .month),
        Notification(
            type: .subscription,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            date: "15 мая",
            section: .month),
        Notification(
            type: .comment,
            user: User(userName: "ruskibeast", avatar: "ruskibeast"),
            publicationName: "1",
            comment: "'аваыаы'",
            date: "15 мая",
            section: .month),
        Notification(
            type: .like,
            user: User(userName: "ruslanonly", avatar: "ruslanonly"),
            publicationName: "1",
            date: "15 мая",
            section: .month),
        Notification(
            type: .comment,
            user: User(userName: "ba1zhina", avatar: "ba1zhina"),
            publicationName: "1",
            comment: "'😼🤭🤪'",
            date: "15 мая",
            section: .month),
        Notification(
            type: .subscription,
            user: User(userName: "ba1zhina", avatar: "ba1zhina"),
            date: "15 мая",
            section: .month)
    ]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        setupNotificationTableView()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeGestureRecognizer.direction = .right
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    private func  setupNavigationTitle() {
        let titleLabel = UILabel()
        titleLabel.attributedText = NSAttributedString(
            string: "Действия",
            attributes: [.font: UIFont.systemFont(ofSize: 28,
            weight: .bold),
            .foregroundColor: UIColor.white]
        )
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    private func setupNotificationTableView() {
        notificationsTableView = UITableView(frame: view.bounds, style: .plain)
        notificationsTableView.register(LikeNotificationTableViewCell.self, forCellReuseIdentifier: "Like")
        notificationsTableView.register(CommentNotificationTableViewCell.self, forCellReuseIdentifier: "Comment")
        notificationsTableView.register(
            SubscriptionNotificationTableViewCell.self,
            forCellReuseIdentifier: "Subscription"
        )
        notificationsTableView.dataSource = self
        notificationsTableView.delegate = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        notificationsTableView.refreshControl = refreshControl
        notificationsTableView.flashScrollIndicators()
        view.addSubview(notificationsTableView)
    }
    
    @objc func swipe(_ swipeGestureRecognizer: UISwipeGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
    }
}

extension NotificationsViewController: UITableViewDelegate {
    
}

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 0, view.bounds.width, 50)
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        titleLabel.backgroundColor = .black
        switch section {
            case 0:
                titleLabel.text = "   Сегодня"
                return titleLabel
            case 1:
                titleLabel.text = "   На этой неделе"
                return titleLabel
            case 2:
                titleLabel.text = "   В этом месяце"
                return titleLabel
            default:
                return titleLabel
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notificationType = notifications[indexPath.section][indexPath.row].type
        
        switch notificationType {
            case .like:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "Like",
                    for: indexPath
                ) as! LikeNotificationTableViewCell
                cell.selectionStyle = .none
                cell.configure(notifications[indexPath.section][indexPath.row])
                return cell
            case .comment:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "Comment",
                    for: indexPath
                ) as! CommentNotificationTableViewCell
                cell.selectionStyle = .none
                cell.configure(notifications[indexPath.section][indexPath.row])
                return cell
            case .subscription:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "Subscription",
                    for: indexPath
                ) as! SubscriptionNotificationTableViewCell
                cell.selectionStyle = .none
                cell.configure(notifications[indexPath.section][indexPath.row])
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
