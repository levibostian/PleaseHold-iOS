@testable import Pods_PleaseHold_Example
import XCTest

class ViewControllerTests: XCTestCase {
    var app: XCUIApplication!
    var viewController: ViewControllerPageObject!

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments.append("--uitesting")

        viewController = ViewControllerPageObject(app: app)
    }

    override func tearDown() {}

    func test_coldStart_viewShowingCorrectViews() {
        app.launch()

        viewController.pleaseHoldView.assertShown()
        viewController.titleLabel.assertShown()
        viewController.messageLabel.assertShown()
    }
}

class ViewControllerPageObject {
    let app: XCUIApplication

    var pleaseHoldView: XCUIElement {
        return app.otherElements[AccessibilityIdentifiers.pleaseHoldView]
    }

    var titleLabel: XCUIElement {
        return app.staticTexts["Please wait..."]
    }

    var messageLabel: XCUIElement {
        return app.staticTexts["Wait for this thing to happen."]
    }

    init(app: XCUIApplication) {
        self.app = app
    }
}
