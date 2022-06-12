//
//  MainViewControllerUITests.swift
//  Give Me RecipeUITests
//
//  Created by Artem Astapov on 04.06.2022.
//

import XCTest
@testable import Give_Me_Recipe

class MainViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testWhenClickRandomRecipeButtonNewRecipeVCAppears() {
        XCUIApplication().buttons["Button Random recipe"].staticTexts["Random recipe"].tap()
    }
}
