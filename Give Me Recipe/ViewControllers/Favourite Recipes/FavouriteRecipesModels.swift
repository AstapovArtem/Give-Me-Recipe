//
//  FavouriteRecipesModels.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.06.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum FavouriteRecipes {
   
  enum Model {
    struct Request {
      enum RequestType {
        case fetchMyFavouriteRecipes
        case deleteFavouriteRecipe(id: String)
        case openSelectedRecipe(recipe: MealRecipeViewModel)
      }
    }
    struct Response {
      enum ResponseType {
          case presentFavouriteRecipes(myFavouriteRecipes: [MyFavouriteRecipe])
          case presentDeletionFavouriteRecipe
          case presentSelectedRecipe(recipe: MealRecipeViewModel)
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayMyFavouritesRecipes(favouriteRecipes: [MealRecipeViewModel])
          case displaySuccessDeletionFavouriteRecipe
          case displaySelectedRecipe(recipe: MealRecipeViewModel)
      }
    }
  }
  
}
