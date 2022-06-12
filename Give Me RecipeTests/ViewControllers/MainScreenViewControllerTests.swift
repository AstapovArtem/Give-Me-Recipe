//
//  MainScreenViewControllerTests.swift
//  Give Me RecipeTests
//
//  Created by Artem Astapov on 03.06.2022.
//

import XCTest
@testable import Give_Me_Recipe

class MainScreenViewControllerTests: XCTestCase {
    
    var sut: MainScreenViewController!
    
    override func setUp() {
        super.setUp()
        sut = MainScreenViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenViewIsLoadedTextLabelNotNil() {
        XCTAssertNotNil(sut.textLabel)
    }
    
    func testTextLabelContainText() {
        XCTAssertEqual(sut.textLabel.text, "Recipe for any cases")
    }
    
    func testWhenViewIsLoadedFindRandomRecipeButtonNotNil() {
        XCTAssertNotNil(sut.findRandomRecipeButton)
    }
    
    func testFindRandomRecipeButtonContainText() {
        XCTAssertEqual(sut.findRandomRecipeButton.titleLabel?.text, "Random recipe")
    }
    

}
