//
//  UIStackView+Extensions.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/28.
//

import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview(_:))
    }
}
