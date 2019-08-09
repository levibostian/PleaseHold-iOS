//
//  UIViewExtension.swift
//  PleaseHold_Tests
//
//  Created by Levi Bostian on 8/8/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var autoLayoutConfigured: Bool {
        return translatesAutoresizingMaskIntoConstraints == false
    }
}
