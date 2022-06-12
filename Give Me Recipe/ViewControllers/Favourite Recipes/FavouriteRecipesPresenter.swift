//
//  FavouriteRecipesPresenter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.06.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavouriteRecipesPresentationLogic {
    func presentData(response: FavouriteRecipes.Model.Response.ResponseType)
}

class FavouriteRecipesPresenter: FavouriteRecipesPresentationLogic {
    
    weak var viewController: FavouriteRecipesDisplayLogic?
    
    func presentData(response: FavouriteRecipes.Model.Response.ResponseType) {
        
        switch response {
        case .presentFavouriteRecipes(myFavouriteRecipes: let myFavouriteRecipes):
            let mealRecipeViewModels = changeFormatFavouriteRecipes(recipes: myFavouriteRecipes)
            viewController?.displayData(viewModel: .displayMyFavouritesRecipes(favouriteRecipes: mealRecipeViewModels))
            
        case .presentDeletionFavouriteRecipe:
            viewController?.displayData(viewModel: .displaySuccessDeletionFavouriteRecipe)
        }
        
    }
    
    private func changeFormatFavouriteRecipes(recipes: [MyFavouriteRecipe]) -> [MealRecipeViewModel] {
        var mealRecipeViewModels = [MealRecipeViewModel]()
        
        for recipe in recipes {
            guard let id = recipe.id,
                  let name = recipe.name,
                  let category = recipe.category,
                  let area = recipe.area,
                  let instructions = recipe.instructions else { break }
            
            let mealRecipeVM = MealRecipeViewModel(id: id,
                                                   name: name,
                                                   category: category,
                                                   area: area,
                                                   instructions: instructions,
                                                   picture: recipe.picture,
                                                   ingredient1: recipe.ingredient1,
                                                   ingredient2: recipe.ingredient2,
                                                   ingredient3: recipe.ingredient3,
                                                   ingredient4: recipe.ingredient4,
                                                   ingredient5: recipe.ingredient5,
                                                   ingredient6: recipe.ingredient6,
                                                   ingredient7: recipe.ingredient7,
                                                   ingredient8: recipe.ingredient8,
                                                   ingredient9: recipe.ingredient9,
                                                   ingredient10: recipe.ingredient10,
                                                   ingredient11: recipe.ingredient11,
                                                   ingredient12: recipe.ingredient12,
                                                   ingredient13: recipe.ingredient13,
                                                   ingredient14: recipe.ingredient14,
                                                   ingredient15: recipe.ingredient15,
                                                   ingredient16: recipe.ingredient16,
                                                   ingredient17: recipe.ingredient17,
                                                   ingredient18: recipe.ingredient18,
                                                   ingredient19: recipe.ingredient19,
                                                   ingredient20: recipe.ingredient20,
                                                   measure1: recipe.measure1,
                                                   measure2: recipe.measure2,
                                                   measure3: recipe.measure3,
                                                   measure4: recipe.measure4,
                                                   measure5: recipe.measure5,
                                                   measure6: recipe.measure6,
                                                   measure7: recipe.measure7,
                                                   measure8: recipe.measure8,
                                                   measure9: recipe.measure9,
                                                   measure10: recipe.measure10,
                                                   measure11: recipe.measure11,
                                                   measure12: recipe.measure12,
                                                   measure13: recipe.measure13,
                                                   measure14: recipe.measure14,
                                                   measure15: recipe.measure15,
                                                   measure16: recipe.measure16,
                                                   measure17: recipe.measure17,
                                                   measure18: recipe.measure18,
                                                   measure19: recipe.measure19,
                                                   measure20: recipe.measure20,
                                                   source: recipe.source)
            
            mealRecipeViewModels.append(mealRecipeVM)
        }
        
        return mealRecipeViewModels
    }
    
}
