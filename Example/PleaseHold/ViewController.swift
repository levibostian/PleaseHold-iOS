import PleaseHold
import UIKit

class ViewController: UIViewController {
    private var didSetupConstraints = false

    let pleaseHoldView: PleaseHoldView = {
        let view = PleaseHoldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = AccessibilityIdentifiers.pleaseHoldView
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green // Setting background color to demonstrate the `PleaseHoldView` has a default backtround color of transparent so it adapts to the background color you set of parent.

        view.addSubview(pleaseHoldView)
        setupViews()

        view.setNeedsUpdateConstraints()
    }

    private func setupViews() {
        pleaseHoldView.title = "Please wait..."
        pleaseHoldView.message = "Wait for this thing to happen."
    }

    override func updateViewConstraints() {
        if !didSetupConstraints {
            let superviewMargins = view.layoutMarginsGuide

            pleaseHoldView.leadingAnchor.constraint(equalTo: superviewMargins.leadingAnchor).isActive = true
            pleaseHoldView.topAnchor.constraint(equalTo: superviewMargins.topAnchor).isActive = true
            pleaseHoldView.trailingAnchor.constraint(equalTo: superviewMargins.trailingAnchor).isActive = true
            pleaseHoldView.bottomAnchor.constraint(equalTo: superviewMargins.bottomAnchor).isActive = true

            didSetupConstraints = true
        }

        super.updateViewConstraints()
    }
}
