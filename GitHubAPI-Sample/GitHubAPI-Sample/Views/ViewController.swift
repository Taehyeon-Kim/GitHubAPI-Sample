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
        LoginManager.shared.performOAuthLoginFlow(for: provider)
    }
}
