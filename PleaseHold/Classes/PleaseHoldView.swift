import Foundation
import UIKit

/// Quick and easy progress UIView to place in your app.
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

    /// Read-only reference to the title `UILabel`.
    public var titleLabel: UILabel {
        return _config.titleLabel
    }

    /// Read-only reference to the message `UILabel`
    public var messageLabel: UILabel {
        return _config.messageLabel
    }

    /// Read-only reference to the `UIActivityIndicatorView`.
    public var activityIndicator: UIActivityIndicatorView {
        return _config.activityIndicator
    }

    private var addTitleLabel: Bool {
        return title != nil
    }

    private var addMessageLabel: Bool {
        return message != nil
    }

    /// Internal use only.
    public let rootView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalCentering
        view.alignment = .center
        view.spacing = 18
        return view
    }()

    /// Read or change the text of `titleLabel`
    public var title: String? {
        didSet {
            build()
        }
    }

    /// Read or change the text of `messageLabel`
    public var message: String? {
        didSet {
            build()
        }
    }

    /// Initialize new instance of `PleaseHoldView` with a value for the `titleLabel` and `messageLabel`.
    public convenience init(title: String?, message: String?) {
        self.init(frame: CGRect.zero)

        self.title = title
        self.message = message

        build()
    }

    private func build() {
        removeAllSubviews()

        if addTitleLabel {
            rootView.addArrangedSubview(titleLabel)
        }
        if addMessageLabel {
            rootView.addArrangedSubview(messageLabel)
        }

        rootView.addArrangedSubview(activityIndicator)
        addSubview(rootView)

        setupConstraints()
        configView()
    }

    /// Internal use only.
    override init(frame: CGRect) {
        super.init(frame: frame)

        build()
    }

    private func configView() {
        titleLabel.text = title
        messageLabel.text = message
    }

    private func setupConstraints() {
        let superviewMargins = layoutMarginsGuide
        let rootViewPadding = _config.viewPadding

        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.centerYAnchor.constraint(equalTo: superviewMargins.centerYAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: superviewMargins.leadingAnchor, constant: rootViewPadding).isActive = true
        rootView.trailingAnchor.constraint(equalTo: superviewMargins.trailingAnchor, constant: -rootViewPadding).isActive = true

        if addTitleLabel {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = true
        }

        if addMessageLabel {
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = true
            messageLabel.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = true
        }

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        updateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
