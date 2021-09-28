//
//  UserManager.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/28.
//

import UIKit

import Alamofire
import Firebase
import KeychainSwift

class UserManager {
    
    /// singleton
    static let shared = UserManager()
    
    private init() {}
    
    public func getUser() {
        let url = "https://api.github.com/user"
        let accessToken = KeychainSwift().get("accessToken") ?? ""
        let headers: HTTPHeaders = ["Accept": "application/vnd.github.v3+json",
                                    "Authorization": "token \(accessToken)"]

        AF.request(url, method: .get, parameters: [:], headers: headers).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let json):
                print(json as! [String: Any])
            case .failure:
                print("")
            }
        })
    }
}
