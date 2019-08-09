//
//  PleaseHoldView.swift
//  PleaseHold
//
//  Created by Levi Bostian on 8/8/19.
//

import Foundation
import UIKit

public class PleaseHoldView: UIView {

    /// Access to `PleaseHoldViewConfig` to set defaults on all instances of `PleaseHoldView`.
    public static let defaultConfig: PleaseHoldViewConfig = PleaseHoldViewConfig.shared
    /// Override `defaultConfig` for this once instance.
    public var config: PleaseHoldViewConfig? {
        didSet {
            build()
        }
    }

    private var _config: PleaseHoldViewConfig {
        return config ?? PleaseHoldView.defaultConfig
    }

    public var titleLabel: UILabel {
        return _config.titleLabel
    }

    public var messageLabel: UILabel {
        return _config.messageLabel
    }

    public var activityIndicator: UIActivityIndicatorView {
        return _config.activityIndicator
    }

    private var addTitleLabel: Bool {
        return title != nil
    }

    private var addMessageLabel: Bool {
        return message != nil
    }

    public let rootView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 18
        return view
    }()

    public var title: String? {
        didSet {
            build()
        }
    }

    public var message: String? {
        didSet {
            build()
        }
    }

    public convenience init() {
        self.init(title: nil, message: nil)
    }

    public convenience init(title: String?, message: String?) {
        self.init(frame: CGRect.zero)

        self.title = title
        self.message = message

        build()
    }

    private func build() {
        self.removeAllSubviews()

        if addTitleLabel {
            rootView.addArrangedSubview(titleLabel)
        }
        if addMessageLabel {
            rootView.addArrangedSubview(messageLabel)
        }

        rootView.addArrangedSubview(activityIndicator)
        self.addSubview(rootView)

        setupConstraints()
        configView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        build()
    }

    private func configView() {
        titleLabel.text = title
        messageLabel.text = message
    }

    private func setupConstraints() {
        var isAutoLayoutConstraintActive = true
        var translatesAutoresizingMaskIntoConstraintsValue = false

        if !_config.useAutoLayoutConstraints {
            isAutoLayoutConstraintActive = !isAutoLayoutConstraintActive
            translatesAutoresizingMaskIntoConstraintsValue = !translatesAutoresizingMaskIntoConstraintsValue
        }

        let superviewMargins = layoutMarginsGuide
        let rootViewPadding = _config.viewPadding

        rootView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraintsValue
        rootView.centerYAnchor.constraint(equalTo: superviewMargins.centerYAnchor).isActive = isAutoLayoutConstraintActive
        rootView.leadingAnchor.constraint(equalTo: superviewMargins.leadingAnchor, constant: rootViewPadding).isActive = isAutoLayoutConstraintActive
        rootView.trailingAnchor.constraint(equalTo: superviewMargins.trailingAnchor, constant: -rootViewPadding).isActive = isAutoLayoutConstraintActive

        if addTitleLabel {
            titleLabel.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraintsValue
            titleLabel.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = isAutoLayoutConstraintActive
            titleLabel.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = isAutoLayoutConstraintActive
        }

        if addMessageLabel {
            messageLabel.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraintsValue
            messageLabel.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = isAutoLayoutConstraintActive
            messageLabel.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = isAutoLayoutConstraintActive
        }

        activityIndicator.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraintsValue

        self.updateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
