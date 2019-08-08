//
//  ViewController.swift
//  PleaseHold
//
//  Created by Levi Bostian on 08/08/2019.
//  Copyright (c) 2019 Levi Bostian. All rights reserved.
//

import UIKit
import PleaseHold

class ViewController: UIViewController {
    private var didSetupConstraints = false

    let pleaseHoldView: PleaseHoldView = {
        let view = PleaseHoldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green // Setting background color to demonstrate the `PleaseHoldView` has a default backtround color of transparent so it adapts to the background color you set of parent.

        self.view.addSubview(pleaseHoldView)
        self.setupViews()

        view.setNeedsUpdateConstraints()
    }

    private func setupViews() {
        pleaseHoldView.title = "Please wait..."
        pleaseHoldView.message = "Wait for this thing to happen."
    }

    override func updateViewConstraints() {
        if !didSetupConstraints {
            let superviewMargins = self.view.layoutMarginsGuide

            pleaseHoldView.leadingAnchor.constraint(equalTo: superviewMargins.leadingAnchor).isActive = true
            pleaseHoldView.topAnchor.constraint(equalTo: superviewMargins.topAnchor).isActive = true
            pleaseHoldView.trailingAnchor.constraint(equalTo: superviewMargins.trailingAnchor).isActive = true
            pleaseHoldView.bottomAnchor.constraint(equalTo: superviewMargins.bottomAnchor).isActive = true

            didSetupConstraints = true
        }

        super.updateViewConstraints()
    }

}
