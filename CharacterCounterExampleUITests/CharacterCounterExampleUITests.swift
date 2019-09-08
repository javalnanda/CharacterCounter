import XCTest

class CharacterCounterExampleUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    func test_counter_restrictsTextField_forSpecifiedMaxLimit() {
        let textField = app.textFields["textFieldWithCounterAccessoryView"]
        textField.tap()
        textField.typeText("five+1")
        XCTAssertEqual((textField.value as? String)?.count, 5)
    }

    func test_counter_restrictsTextView_forSpecifiedMaxLimit() {
        let textView = app.textViews["textViewWithCounterAccessoryView"]
        textView.tap()
        textView.typeText("ten plus characters")
        XCTAssertEqual((textView.value as? String)?.count, 10)
    }

    func test_counterBehaviour_whenNotUsedAsAccessoryView() {
        let textField = app.textFields["textFieldWithoutCounterAccessoryView"]
        textField.tap()
        textField.typeText("five+1")
        let counterLabel = app.otherElements["textFieldCounter"]
        XCTAssertTrue(counterLabel.exists)
        XCTAssertEqual((textField.value as? String)?.count, 5)
        app.tap()
        XCTAssertFalse(counterLabel.exists)
    }

    func test_onDoneTap_resignsKeyboard() {
        let doneButton = app.buttons["accessoryViewDoneButton"]

        let textField = app.textFields["textFieldWithCounterAccessoryView"]
        textField.tap()
        textField.typeText("five+1")
        doneButton.tap()
        XCTAssertFalse(doneButton.exists)

        let textView = app.textViews["textViewWithCounterAccessoryView"]
        textView.tap()
        textView.typeText("ten plus characters")
        doneButton.tap()
        XCTAssertFalse(doneButton.exists)
    }
}
