import PleaseHold
import XCTest

class PleaseHoldViewTests: XCTestCase {
    private var pleaseHoldView: PleaseHoldView!

    override func setUp() {
        super.setUp()

        pleaseHoldView = PleaseHoldView()
    }

    func test_init_noSubviews() {
        XCTAssertNil(pleaseHoldView.titleLabel)
        XCTAssertNil(pleaseHoldView.messageLabel)
        XCTAssertNotNil(pleaseHoldView.activityIndicator)
    }

    func test_setTitle_expectLabelAdded() {
        let title = "title"
        pleaseHoldView.title = title

        XCTAssertNotNil(pleaseHoldView.titleLabel)
        XCTAssertNil(pleaseHoldView.messageLabel)
        XCTAssertNotNil(pleaseHoldView.activityIndicator)
        XCTAssertTrue(pleaseHoldView.rootView.arrangedSubviews.contains(pleaseHoldView.titleLabel!))

        XCTAssertEqual(pleaseHoldView.titleLabel?.text, title)
    }

    func test_setMessage_expectLabelAdded() {
        let message = "message"
        pleaseHoldView.message = message

        XCTAssertNil(pleaseHoldView.titleLabel)
        XCTAssertNotNil(pleaseHoldView.messageLabel)
        XCTAssertNotNil(pleaseHoldView.activityIndicator)
        XCTAssertTrue(pleaseHoldView.rootView.arrangedSubviews.contains(pleaseHoldView.messageLabel!))

        XCTAssertEqual(pleaseHoldView.messageLabel?.text, message)
    }

    func test_setTitleThenNil_expectRemoveLabel() {
        let title = "title"
        pleaseHoldView.title = title

        let oldTitleLabel: UILabel = pleaseHoldView.titleLabel!

        pleaseHoldView.title = nil

        XCTAssertNil(pleaseHoldView.titleLabel)
        XCTAssertNil(pleaseHoldView.messageLabel)
        XCTAssertFalse(pleaseHoldView.rootView.arrangedSubviews.contains(oldTitleLabel))
    }

    func test_setMessageThenNil_expectRemoveLabel() {
        let message = "message"
        pleaseHoldView.message = message

        let oldMessageLabel: UILabel = pleaseHoldView.messageLabel!

        pleaseHoldView.message = nil

        XCTAssertNil(pleaseHoldView.titleLabel)
        XCTAssertNil(pleaseHoldView.messageLabel)
        XCTAssertFalse(pleaseHoldView.rootView.arrangedSubviews.contains(oldMessageLabel))
    }

    func test_useConfig() {
        let expectCustomizeTitleLabel = XCTestExpectation(description: "Expect to customize title label")
        let expectCustomizeMessageLabel = XCTestExpectation(description: "Expect to customize message label")

        let changedTextColor: UIColor = .red

        let config: PleaseHoldViewConfig = {
            let config = PleaseHoldViewConfig()
            config.newTitleLabel = {
                let label = PleaseHoldViewConfig.defaultTitleLabel
                label.textColor = changedTextColor
                expectCustomizeTitleLabel.fulfill()
                return label
            }
            config.newMessageLabel = {
                let label = PleaseHoldViewConfig.defaultMessageLabel
                label.textColor = changedTextColor
                expectCustomizeMessageLabel.fulfill()
                return label
            }
            return config
        }()
        pleaseHoldView.config = config

        pleaseHoldView.title = "title"
        pleaseHoldView.message = "message"

        wait(for: [expectCustomizeTitleLabel, expectCustomizeMessageLabel], timeout: TestUtil.timeoutDefault)

        XCTAssertEqual(pleaseHoldView.titleLabel?.textColor, changedTextColor)
        XCTAssertEqual(pleaseHoldView.messageLabel?.textColor, changedTextColor)
    }
}
