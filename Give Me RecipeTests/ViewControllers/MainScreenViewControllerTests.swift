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
    
    func testWhenViewIsLoadedRandomRecipeButtonExists() {
        XCTAssertNotNil(sut.findRandomRecipeButton)
    }
    
    func testRandomRecipeButtonContainText() {
        XCTAssertEqual(sut.findRandomRecipeButton.currentTitle, "Random recipe")
    }
    
    func testWhenViewIsLoadedFavouriteRecipesButtonExists() {
        XCTAssertNotNil(sut.favouriteRecipesButton)
    }
    
    func testFavouriteRecipesButtonContainText() {
        XCTAssertEqual(sut.favouriteRecipesButton.currentTitle, "My favourite recipes")
    }
    
    func testWhenViewIsLoadedBackgroundImageNotNil() {
        XCTAssertNotNil(sut.backgroundImage.image)
    }
    
    func testRandomRecipeButtonHasOpenRandomRecipeMethod() {
        let button = sut.findRandomRecipeButton
        guard let actions = button.actions(forTarget: sut, forControlEvent: .allEvents) else {
            XCTFail()
            return
        }
        XCTAssertTrue(actions.contains("openRandomRecipe"))
    }
    
    func testOpenRandomRecipeMethodOpenRandomRecipeViewController() {
        let newVC = openRandomRecipe()
        
        XCTAssertNotNil(newVC)
    }
    
    
    private func openRandomRecipe() -> RecipeViewController {
        UIApplication.shared.keyWindow?.rootViewController = sut
//        sut.openRandomRecipe()
        sut.performSelector(onMainThread: #selector(MainScreenViewController.openRandomRecipe), with: sut.findRandomRecipeButton, waitUntilDone: true)
        let newVC = sut.presentedViewController as! RecipeViewController
        return newVC
    }

}
