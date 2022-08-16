//
//  RecipeViewCotrollerTests.swift
//  Give Me RecipeTests
//
//  Created by Artem Astapov on 05.06.2022.
//

import XCTest
@testable import Give_Me_Recipe

class RecipeViewCotrollerTests: XCTestCase {
    
    var sut: RecipeViewController!
    var recipe: MealRecipeViewModel!
    
    override func setUp() {
        super.setUp()
        recipe = MealRecipeViewModel(id: "52844",
                                     name: "Lasagne",
                                     category: "Pasta",
                                     area: "Italian",
                                     instructions: "Heat the oil in a large saucepan. Use kitchen scissors to snip the bacon into small pieces, or use a sharp knife to chop it on a chopping board. Add the bacon to the pan and cook for just a few mins until starting to turn golden. Add the onion, celery and carrot, and cook over a medium heat for 5 mins, stirring occasionally, until softened. Add the garlic and cook for 1 min, then tip in the mince and cook, stirring and breaking it up with a wooden spoon, for about 6 mins until browned all over. Stir in the tomato purée and cook for 1 min, mixing in well with the beef and vegetables. Tip in the chopped tomatoes. Fill each can half full with water to rinse out any tomatoes left in the can, and add to the pan. Add the honey and season to taste. Simmer for 20 mins. Heat oven to 200C/180C fan/gas 6. To assemble the lasagne, ladle a little of the ragu sauce into the bottom of the roasting tin or casserole dish, spreading the sauce all over the base. Place 2 sheets of lasagne on top of the sauce overlapping to make it fit, then repeat with more sauce and another layer of pasta. Repeat with a further 2 layers of sauce and pasta, finishing with a layer of pasta. Put the crème fraîche in a bowl and mix with 2 tbsp water to loosen it and make a smooth pourable sauce. Pour this over the top of the pasta, then top with the mozzarella. Sprinkle Parmesan over the top and bake for 25–30 mins until golden and bubbling. Serve scattered with basil, if you like.",
                                     picture: "https://www.themealdb.com/images/media/meals/wtsvxx1511296896.jpg",
                                     ingredient1: "Olive Oil",
                                     ingredient2: "Bacon",
                                     ingredient3: "Onion",
                                     ingredient4: "Celery",
                                     ingredient5: "Carrots",
                                     ingredient6: "Garlic",
                                     ingredient7: "Minced Beef",
                                     ingredient8: "Tomato Puree",
                                     ingredient9: "Chopped Tomatoes",
                                     ingredient10: "Honey",
                                     ingredient11: "Lasagne Sheets",
                                     ingredient12: "Creme Fraiche",
                                     ingredient13: "Mozzarella Balls",
                                     ingredient14: "Parmesan Cheese",
                                     ingredient15: "Basil Leaves",
                                     ingredient16: "",
                                     ingredient17: "",
                                     ingredient18: "",
                                     ingredient19: "",
                                     ingredient20: "",
                                     measure1: "1 tblsp",
                                     measure2: "2",
                                     measure3: "1 finely chopped",
                                     measure4: "1 Stick",
                                     measure5: "1 medium",
                                     measure6: "2 cloves chopped",
                                     measure7: "500g",
                                     measure8: "1 tbls",
                                     measure9: "800g",
                                     measure10: "1 tblsp ",
                                     measure11: "500g",
                                     measure12: "400ml",
                                     measure13: "125g",
                                     measure14: "50g",
                                     measure15: "Topping",
                                     measure16: "",
                                     measure17: "",
                                     measure18: "",
                                     measure19: "",
                                     measure20: "",
                                     source: "https://www.bbcgoodfood.com/recipes/classic-lasagne")
        
        sut = RecipeViewController(recipeViewModel: recipe, nibName: nil, bundle: nil)
        sut.setNavigationControllerDelegate(with: NavigationViewController())
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        recipe = nil
    }
    
    func testViewControllerNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func testWhenViewControllerIsLoadedMealNameExists() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertEqual(self.sut.mealNameLabel.text, "wrong answer")
        }
    }
    
    
}
