//
//  MainScreenPresenter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainScreenPresentationLogic {
    func presentData(response: MainScreen.Model.Response.ResponseType)
}

class MainScreenPresenter: MainScreenPresentationLogic {
    weak var viewController: MainScreenDisplayLogic?
    
    func presentData(response: MainScreen.Model.Response.ResponseType) {
        
        switch response {
        case .presentRandomRecipe(let response):
            guard let recipe = response.meals.first as? MealRecipe  else { return }
            let mealRecipeViewModel = recipeViewModel(from: recipe)
            viewController?.displayData(viewModel: .displayRandomRecipe(viewModel: mealRecipeViewModel))
            
        case .presentFavouritesRecipesScreen:
            viewController?.displayData(viewModel: .displayFavouriteRecipesScreen)
        }
    }
    
    private func recipeViewModel(from response: MealRecipe) -> MealRecipeViewModel {
        
        return MealRecipeViewModel(id: response.idMeal,
                                   name: response.strMeal,
                                   category: response.strCategory,
                                   area: response.strArea,
                                   instructions: response.strInstructions,
                                   picture: response.strMealThumb,
                                   ingredient1: response.strIngredient1,
                                   ingredient2: response.strIngredient2,
                                   ingredient3: response.strIngredient3,
                                   ingredient4: response.strIngredient4,
                                   ingredient5: response.strIngredient5,
                                   ingredient6: response.strIngredient6,
                                   ingredient7: response.strIngredient7,
                                   ingredient8: response.strIngredient8,
                                   ingredient9: response.strIngredient9,
                                   ingredient10: response.strIngredient10,
                                   ingredient11: response.strIngredient11,
                                   ingredient12: response.strIngredient12,
                                   ingredient13: response.strIngredient13,
                                   ingredient14: response.strIngredient14,
                                   ingredient15: response.strIngredient15,
                                   ingredient16: response.strIngredient16,
                                   ingredient17: response.strIngredient17,
                                   ingredient18: response.strIngredient18,
                                   ingredient19: response.strIngredient19,
                                   ingredient20: response.strIngredient20,
                                   measure1: response.strMeasure1,
                                   measure2: response.strMeasure2,
                                   measure3: response.strMeasure3,
                                   measure4: response.strMeasure4,
                                   measure5: response.strMeasure5,
                                   measure6: response.strMeasure6,
                                   measure7: response.strMeasure7,
                                   measure8: response.strMeasure8,
                                   measure9: response.strMeasure9,
                                   measure10: response.strMeasure10,
                                   measure11: response.strMeasure11,
                                   measure12: response.strMeasure12,
                                   measure13: response.strMeasure13,
                                   measure14: response.strMeasure14,
                                   measure15: response.strMeasure15,
                                   measure16: response.strMeasure16,
                                   measure17: response.strMeasure17,
                                   measure18: response.strMeasure18,
                                   measure19: response.strMeasure19)
    }
    
}
