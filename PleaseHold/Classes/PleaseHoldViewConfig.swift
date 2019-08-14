import Foundation

/// Configuration for `PleaseHoldView`
public class PleaseHoldViewConfig {
    /// Singleton access to `PleaseHoldViewConfig`.
    public static var shared: PleaseHoldViewConfig = PleaseHoldViewConfig()

    /// Initialize new instance of `PleaseHoldViewConfig`
    public init() {}

    /// Customize the title `UILabel` of `PleaseHoldView`. Called when adding a title to `PleaseHoldView` instances.
    public var newTitleLabel: () -> UILabel = {
        PleaseHoldViewConfig.defaultTitleLabel
    }

    /// The default title label for `PleaseHoldView`.
    public static var defaultTitleLabel: UILabel {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = UIFont.boldSystemFont(ofSize: 24)
        return view
    }

    /// Customize the message `UILabel` of `PleaseHoldViewConfig`. Called when adding a message to `PleaseHoldViewConfig` instances.
    public var newMessageLabel: () -> UILabel = {
        PleaseHoldViewConfig.defaultMessageLabel
    }

    /// The default message label for `PleaseHoldView`.
    public static var defaultMessageLabel: UILabel {
        let view = UILabel()
        view.textColor = .darkText
        view.textAlignment = .center
        view.numberOfLines = 0
        view.font = view.font.withSize(18)
        return view
    }

    /// Customize the message `UILabel` of `PleaseHoldViewConfig`. Called when adding a message to `PleaseHoldViewConfig` instances.
    public var newActivityIndicator: () -> UIActivityIndicatorView = {
        PleaseHoldViewConfig.defaultActivityIndicator
    }

    /// Edit the `UIActivityIndicatorView` used as the activity indicator for `PleaseHoldView`
    public static var defaultActivityIndicator: UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.style = .gray
        view.startAnimating()
        return view
    }

    /// Set the padding for the leading and trailing side of the contents of `PleaseHoldView`.
    public var viewPadding: CGFloat = 20.0
}
