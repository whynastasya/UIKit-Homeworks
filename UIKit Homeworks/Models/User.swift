//
//  User.swift
//  UIKit Homeworks
//
//  Created by nastasya on 14.05.2023.
//

import Foundation

struct User {
    var userName: String
    var name: String = ""
    var avatar: String
    var publications: [Publication] = []
//    var followers: [User] = []
//    var following: [User] = []
    var followersCount: String = ""
    var followingCount: String = ""
    var commonFollowers: String = ""
    var signature: String = ""
    var stories: [Story] = []
}
