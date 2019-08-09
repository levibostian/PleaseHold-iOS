import XCTest
import PleaseHold

class PleaseHoldViewTests: XCTestCase {

    private var pleaseHoldView: PleaseHoldView!
    
    override func setUp() {
        super.setUp()

        pleaseHoldView = PleaseHoldView()
    }
    
    func test_setTitleInInit_expectTitleLabelToSet() {
        let title = "title here"
        pleaseHoldView = PleaseHoldView(title: title, message: nil)

        XCTAssertEqual(pleaseHoldView.titleLabel.text, title)
    }

    func test_setMessageInInit_expectTitleLabelToSet() {
        let message = "message here"
        pleaseHoldView = PleaseHoldView(title: nil, message: message)

        XCTAssertEqual(pleaseHoldView.messageLabel.text, message)
    }

    func test_setTitleAfterInit_expectTitleLabelToSet() {
        let oldTitle = "old title"
        let newTitle = "new title"
        pleaseHoldView = PleaseHoldView(title: oldTitle, message: nil)
        pleaseHoldView.title = newTitle

        XCTAssertEqual(pleaseHoldView.titleLabel.text, newTitle)
    }

    func test_setMessageAfterInit_expectTitleLabelToSet() {
        let oldMessage = "old message"
        let newMessage = "new message"
        pleaseHoldView = PleaseHoldView(title: nil, message: oldMessage)
        pleaseHoldView.message = newMessage

        XCTAssertEqual(pleaseHoldView.messageLabel.text, newMessage)
    }

    func test_titleLabel_setCustomLabelInConfig() {
        let config = PleaseHoldViewConfig.dark
        let oldTextColor = config.titleLabel.textColor
        let newTextColor: UIColor = .green
        config.titleLabel.textColor = newTextColor
        pleaseHoldView.config = config

        XCTAssertNotEqual(pleaseHoldView.titleLabel.textColor, oldTextColor)
        XCTAssertEqual(pleaseHoldView.titleLabel.textColor, newTextColor)
    }

    func test_messageLabel_setCustomLabelInConfig() {
        let config = PleaseHoldViewConfig.dark
        let oldTextColor = config.messageLabel.textColor
        let newTextColor: UIColor = .green
        config.messageLabel.textColor = newTextColor
        pleaseHoldView.config = config

        XCTAssertNotEqual(pleaseHoldView.messageLabel.textColor, oldTextColor)
        XCTAssertEqual(pleaseHoldView.messageLabel.textColor, newTextColor)
    }

    func test_titleNil_expectDontAddTitleLabel() {
        pleaseHoldView = PleaseHoldView(title: nil, message: "")

        XCTAssertFalse(pleaseHoldView.rootView.subviews.contains(pleaseHoldView.titleLabel))
        XCTAssertTrue(pleaseHoldView.rootView.subviews.contains(pleaseHoldView.messageLabel))
        XCTAssertTrue(pleaseHoldView.rootView.subviews.contains(pleaseHoldView.activityIndicator))
    }

    func test_messageNil_expectDontAddTitleLabel() {
        pleaseHoldView = PleaseHoldView(title: "", message: nil)

        XCTAssertTrue(pleaseHoldView.rootView.subviews.contains(pleaseHoldView.titleLabel))
        XCTAssertFalse(pleaseHoldView.rootView.subviews.contains(pleaseHoldView.messageLabel))
        XCTAssertTrue(pleaseHoldView.rootView.subviews.contains(pleaseHoldView.activityIndicator))
    }
    
}
