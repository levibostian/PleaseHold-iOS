//
//  UIStackViewExtension.swift
//  PleaseHold
//
//  Created by Levi Bostian on 8/14/19.
//

import Foundation
import UIKit

internal extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { subview in
            self.completelyRemoveArrangedSubview(subview)
        }
    }

    func completelyRemoveArrangedSubview(_ view: UIView?) {
        guard let view = view else {
            return
        }

        if arrangedSubviews.contains(view) {
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
