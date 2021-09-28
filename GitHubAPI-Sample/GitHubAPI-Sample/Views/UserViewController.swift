//
//  UserViewController.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/28.
//

import UIKit

import SnapKit
import Then
import Firebase

class UserViewController: UIViewController {
    
    // MARK: - UI Properties
    
    lazy var profileStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.addArrangedSubviews(profileImageView, nameLabel, bioLabel)
    }

    lazy var profileImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person.circle.fill")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }

    var nameLabel = UILabel().then {
        $0.text = "ENTER YOUR NAME"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textAlignment = .center
    }

    var bioLabel = UILabel().then {
        $0.text = "ENTER YOUR BIO"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    // MARK: - Properties
    
    private var _user: User?
    var user: User? {
        get { _user ?? Auth.auth().currentUser }
        set { _user = newValue }
    }
    
    var statusBarHeight: CGFloat {
        return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var topInset: CGFloat {
        return UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0      // 디바이스 위쪽 여백 (Safe Area 위쪽 여백)
    }
    
    var navigationBarHeight: CGFloat {
        return UINavigationController().navigationBar.frame.height
    }

    var topHeight: CGFloat {
        return statusBarHeight + topInset + navigationBarHeight
    }
    
    // MARK: - Init
    
    init(_ user: User? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    
    override func loadView() {
        print("UserViewController - LoadView()")
        
        view = UIView()     // 이 코드가 없으면 viewDidLoad()메서드가 여러 번 호출되는 문제가 발생한다.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("UserViewController - viewDidLoad()")
        
        configureNavigationBar()
        setupLayout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("UserViewController - viewDidDisappear()")
    }
    
    // MARK: - Private Helpers
    
    private func configureNavigationBar() {
        navigationItem.title = "User"
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        view.addSubviews(profileStackView)
        profileStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(topHeight)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(150)
        }
    }
}

extension UINavigationBar
{
    var largeTitleHeight: CGFloat {
        let maxSize = self.subviews
            .filter { $0.frame.origin.y > 0 }
            .max { $0.frame.origin.y < $1.frame.origin.y }
            .map { $0.frame.size }
        return maxSize?.height ?? 0
    }
}
