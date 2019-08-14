import Foundation

/// Create a set of default views to conveniently set config for `EmptyView`.
public protocol PleaseHoldViewConfigPreset {
    /// The title `UILabel` instance for the present.
    var titleLabel: UILabel { get }
    /// The message `UILabel` instance for the present.
    var messageLabel: UILabel { get }
    /// The `UIActivityIndicatorView` instance for the present.
    var activityIndicator: UIActivityIndicatorView { get }
}

public extension PleaseHoldViewConfigPreset {
    /// Get a `EmptyViewConfig` instance that uses values from `EmptyViewConfigPreset`.
    var config: PleaseHoldViewConfig {
        let config = PleaseHoldViewConfig()
        config.newTitleLabel = { self.titleLabel }
        config.newMessageLabel = { self.messageLabel }
        config.newActivityIndicator = { self.activityIndicator }
        return config
    }
}

/// Convenient set of `UIView`s that are dark in color. Great for light colored backgrounds.
public struct DarkPleaseHoldViewConfigPreset: PleaseHoldViewConfigPreset {
    /// Dark colored title label.
    public var titleLabel: UILabel {
        let label = PleaseHoldViewConfig.defaultTitleLabel
        label.textColor = .darkText
        return label
    }

    /// Dark colored message label.
    public var messageLabel: UILabel {
        let label = PleaseHoldViewConfig.defaultMessageLabel
        label.textColor = .darkText
        return label
    }

    /// Dark colored activity indicator.
    public var activityIndicator: UIActivityIndicatorView {
        let indicator = PleaseHoldViewConfig.defaultActivityIndicator
        indicator.style = .gray
        return indicator
    }
}

/// Convenient set of `UIView`s that are light in color. Great for dark colored backgrounds.
public struct LightPleaseHoldViewConfigPreset: PleaseHoldViewConfigPreset {
    /// Light colored title label.
    public var titleLabel: UILabel {
        let label = PleaseHoldViewConfig.defaultTitleLabel
        label.textColor = .white
        return label
    }

    /// Light colored message label.
    public var messageLabel: UILabel {
        let label = PleaseHoldViewConfig.defaultMessageLabel
        label.textColor = .white
        return label
    }

    /// Light colored activity indicator.
    public var activityIndicator: UIActivityIndicatorView {
        let indicator = PleaseHoldViewConfig.defaultActivityIndicator
        indicator.style = .white
        return indicator
    }
}

public extension PleaseHoldViewConfig {
    /// Convenient access to `DarkPleaseHoldViewConfigPreset`.
    static let darkPresent: PleaseHoldViewConfigPreset = DarkPleaseHoldViewConfigPreset()

    /// Convenient access to `LightPleaseHoldViewConfigPreset`.
    static let light: PleaseHoldViewConfigPreset = LightPleaseHoldViewConfigPreset()
}
