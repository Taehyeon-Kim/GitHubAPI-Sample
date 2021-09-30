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
    
    private let accessToken = KeychainSwift().get("accessToken") ?? ""
    private lazy var headers: HTTPHeaders = [
        "Accept": "application/vnd.github.v3+json",
        "Authorization": "token \(accessToken)"
    ]
    
    private init() {}
    
    public func getUser(completion: @escaping ((UserModel) -> Void)) {
        let url = "https://api.github.com/user"

        
        AF.request(url, method: .get, parameters: [:], headers: headers)
            .responseDecodable(of: UserModel.self, completionHandler: { response in
                switch response.result {
                case .success(let data):
                    completion(data)
                case .failure:
                    print("fail")
                }
            })
                    
//        AF.request(url, method: .get, parameters: [:], headers: headers)
//            .responseJSON(completionHandler: { (response) in
//            switch response.result {
//            case .success(let json):
//                print(json as! [String: Any])
//            case .failure:
//                print("")
//            }
//        })
    }
    
    public func getRepo(completion: @escaping (([RepoModel]) -> Void)) {
        let url = "https://api.github.com/user/repos"
        
        AF.request(url, method: .get, parameters: [:], headers: headers)
            .responseDecodable(of: [RepoModel].self) { response in
                switch response.result {
                case .success(let data):
//                    completion(data)
                    print(data)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
