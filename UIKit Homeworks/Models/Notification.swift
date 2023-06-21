//
//  Notification.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.05.2023.
//

import Foundation

struct Notification {
    let type: NotificationType
    let user: User
    var publicationName: String = ""
    var comment: String = ""
    let date: String
    let section: NotificationSection
}
