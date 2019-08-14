import Foundation
import UIKit

/// Quick and easy progress UIView to place in your app.
public class PleaseHoldView: UIView {
    /// Access to `PleaseHoldViewConfig` to set defaults on all instances of `PleaseHoldView`.
    public static let defaultConfig: PleaseHoldViewConfig = PleaseHoldViewConfig.shared
    /// Override `defaultConfig` for this once instance.
    public var config: PleaseHoldViewConfig = PleaseHoldView.defaultConfig {
        didSet {
            build()
        }
    }

    /// Read-only reference to the title `UILabel`.
    public private(set) var titleLabel: UILabel?

    /// Read-only reference to the message `UILabel`
    public private(set) var messageLabel: UILabel?

    /// Read-only reference to the `UIActivityIndicatorView`.
    public private(set) var activityIndicator: UIActivityIndicatorView!

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

    /// Initialize new instance of `PleaseHoldView`.
    public convenience init() {
        self.init(frame: CGRect.zero)

        build()
    }

    private func build() {
        self.rootView.removeAllArrangedSubviews()
        removeAllSubviews()
        titleLabel = nil
        messageLabel = nil

        if title != nil {
            titleLabel = config.newTitleLabel()
            rootView.addArrangedSubview(titleLabel!)
        }
        if message != nil {
            messageLabel = config.newMessageLabel()
            rootView.addArrangedSubview(messageLabel!)
        }

        activityIndicator = config.newActivityIndicator()
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
        titleLabel?.text = title
        messageLabel?.text = message
    }

    private func setupConstraints() {
        let superviewMargins = layoutMarginsGuide
        let rootViewPadding = config.viewPadding

        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.centerYAnchor.constraint(equalTo: superviewMargins.centerYAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: superviewMargins.leadingAnchor, constant: rootViewPadding).isActive = true
        rootView.trailingAnchor.constraint(equalTo: superviewMargins.trailingAnchor, constant: -rootViewPadding).isActive = true

        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel?.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = true

        messageLabel?.translatesAutoresizingMaskIntoConstraints = false
        messageLabel?.leadingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.leadingAnchor).isActive = true
        messageLabel?.trailingAnchor.constraint(equalTo: rootView.layoutMarginsGuide.trailingAnchor).isActive = true

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        updateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
