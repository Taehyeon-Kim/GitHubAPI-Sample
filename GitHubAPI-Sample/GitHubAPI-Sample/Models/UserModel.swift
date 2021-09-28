//
//  UserModel.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/28.
//

import Foundation

struct UserModel: Codable {
    var avatarURL: String
    var name: String
    var bio: String
    
    init(avatarURL: String,
         name: String,
         bio: String) {
        self.avatarURL = avatarURL
        self.name = name
        self.bio = bio
    }
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case name
        case bio
    }
}
