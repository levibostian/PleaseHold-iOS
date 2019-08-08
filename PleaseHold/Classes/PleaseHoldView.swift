//
//  PleaseHoldView.swift
//  PleaseHold
//
//  Created by Levi Bostian on 8/8/19.
//

import Foundation
import UIKit

public class PleaseHoldView: UIView {

    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 24)
        return view
    }()

    let messageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.font = view.font.withSize(18)
        return view
    }()

    let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .gray
        view.startAnimating()
        return view
    }()

    let rootView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 18
        return view
    }()

    public var title: String? {
        didSet {
            configView()
        }
    }

    public var message: String? {
        didSet {
            configView()
        }
    }

    convenience init() {
        self.init(title: nil, message: nil)
    }

    convenience init(title: String?, message: String?) {
        self.init(frame: CGRect.zero)

        self.title = title
        self.message = message
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        rootView.addArrangedSubview(titleLabel)
        rootView.addArrangedSubview(messageLabel)
        rootView.addArrangedSubview(activityIndicator)
        self.addSubview(rootView)

        configView()
        setupConstraints()
    }

    private func configView() {
        titleLabel.text = title
        messageLabel.text = message
    }

    private func setupConstraints() {
        let superviewMargins = layoutMarginsGuide

        let rootViewPadding: CGFloat = 20.0

        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.centerYAnchor.constraint(equalTo: superviewMargins.centerYAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: superviewMargins.leadingAnchor, constant: rootViewPadding).isActive = true
        rootView.trailingAnchor.constraint(equalTo: superviewMargins.trailingAnchor, constant: -rootViewPadding).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = true

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = true

        self.updateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
