import Foundation

/// Configuration for `PleaseHoldView`
public class PleaseHoldViewConfig {
    /// Singleton access to `PleaseHoldViewConfig`.
    public static var shared: PleaseHoldViewConfig = PleaseHoldViewConfig.dark

    /// Initialize new instance of `PleaseHoldViewConfig`
    public init() {}

    /// Edit the `UILabel` used as the title for `PleaseHoldView`
    public var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = UIFont.boldSystemFont(ofSize: 24)
        return view
    }()

    /// Edit the `UILabel` used as the message for `PleaseHoldView`
    public var messageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = view.font.withSize(18)
        return view
    }()

    /// Edit the `UIActivityIndicatorView` used as the activity indicator for `PleaseHoldView`
    public var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .gray
        view.startAnimating()
        return view
    }()

    /// Set the padding for the leading and trailing side of the contents of `PleaseHoldView`.
    public var viewPadding: CGFloat = 20.0
}

public extension PleaseHoldViewConfig {
    /// Convenient `PleaseHoldViewConfig` instance with `UIView`s that are dark in color. Great for light colored backgrounds.
    static let dark: PleaseHoldViewConfig = {
        let config = PleaseHoldViewConfig()
        config.titleLabel.textColor = .darkText
        config.messageLabel.textColor = .darkText
        config.activityIndicator.style = .gray
        return config
    }()

    /// Convenient `PleaseHoldViewConfig` instance with `UIView`s that are light in color. Great for dark colored backgrounds.
    static let light: PleaseHoldViewConfig = {
        let config = PleaseHoldViewConfig()
        config.titleLabel.textColor = .white
        config.messageLabel.textColor = .white
        config.activityIndicator.style = .white
        return config
    }()
}
