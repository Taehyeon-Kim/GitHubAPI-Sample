//
//  ViewController.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/27.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    private var provider = OAuthProvider(providerID: "github.com")

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapGitHubLoginButton() {
        performOAuthLoginFlow(for: provider)
    }
    
    private func performOAuthLoginFlow(for provider: OAuthProvider) {
        provider.getCredentialWith(nil) { credential, error in
          guard error == nil else { return }
          guard let credential = credential else { return }
          self.signIn(with: credential)
        }
    }
    
    private func signIn(with credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { result, error in
            guard error == nil else { return }
            guard let oauthCredential = result?.credential as? OAuthCredential else { return }
            guard let accessToken = oauthCredential.accessToken else { return }
            print(accessToken)
        }
    }
}
