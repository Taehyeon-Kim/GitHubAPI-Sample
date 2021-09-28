//
//  LoginManager.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/28.
//

import UIKit

import Alamofire
import Firebase
import KeychainSwift

class LoginManager {
    
    /// singleton
    static let shared = LoginManager()
    
    private init() {}
    
    public func performOAuthLoginFlow(for provider: OAuthProvider) {
        provider.getCredentialWith(nil) { credential, error in
          guard error == nil else { return }
          guard let credential = credential else { return }
          self.signIn(with: credential)
        }
    }
    
    public func signIn(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            guard let oauthCredential = result?.credential as? OAuthCredential else { return }
            guard let accessToken = oauthCredential.accessToken else { return }
            KeychainSwift().set(accessToken, forKey: "accessToken")
        }
    }
    
    public func logout() {
        KeychainSwift().clear()
    }
}
