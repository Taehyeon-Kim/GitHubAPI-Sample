//
//  RepoModel.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/30.
//

import Foundation

struct RepoModel: Codable {
    var id: Int
    var name: String
    var fullName: String
    var privacy: Bool
    
    init(id: Int,
         name: String,
         fullName: String,
         privacy: Bool) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.privacy = privacy
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case privacy = "private"
    }
}
