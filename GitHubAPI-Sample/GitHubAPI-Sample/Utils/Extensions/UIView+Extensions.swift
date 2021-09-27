//
//  UIView+Extensions.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/27.
//

import UIKit

extension UIView {
    public func addSubviews(_ views: UIView...) {
        views.forEach (addSubview(_:))
    }
}
