//
//  PleaseHoldViewConfig.swift
//  PleaseHold
//
//  Created by Levi Bostian on 8/8/19.
//

import Foundation

public class PleaseHoldViewConfig {

    /// Singleton access to `PleaseHoldViewConfig`.
    public static var shared: PleaseHoldViewConfig = PleaseHoldViewConfig.dark

    public init() {
    }

    public var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 24)
        return view
    }()

    public var messageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.font = view.font.withSize(18)
        return view
    }()

    public var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .gray
        view.startAnimating()
        return view
    }()

    public var useAutoLayoutConstraints: Bool = true

    public var viewPadding: CGFloat = 20.0

}

public extension PleaseHoldViewConfig {

    static let dark: PleaseHoldViewConfig = {
        let config = PleaseHoldViewConfig()
        config.titleLabel.textColor = .darkText
        config.messageLabel.textColor = .darkText
        config.activityIndicator.style = .gray
        return config
    }()

    static let light: PleaseHoldViewConfig = {
        let config = PleaseHoldViewConfig()
        config.titleLabel.textColor = .white
        config.messageLabel.textColor = .white
        config.activityIndicator.style = .white
        return config
    }()

}
