//
//  RecipeModels.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Recipe {
   
  enum Model {
    struct Request {
      enum RequestType {
          case getDataMealImage(urlString: String)
          case addFavouriteRecipe(viewModel: MealRecipeViewModel)
          case checkIsRecipeFavourite(id: String)
          case deleteFavouriteRecipe(id: String)
      }
    }
    struct Response {
      enum ResponseType {
          case presentMealImage(data: Data)
          case presentReplyFromAddingFavouriteRecipe(reply: Bool)
          case presentIsRecipeFavourite(isFavourite: Bool)
          case presentDeletionFavouriteRecipe
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayMealImage(image: Data)
          case displayResultOfAddingFavouriteRecipe(reply: Bool)
          case displayIsRecipeFavourite(isFavourite: Bool)
          case displaySuccessDeletionFavouriteRecipe
      }
    }
  }
  
}


struct MealRecipeViewModel {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var picture: String?
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    var measure1: String?
    var measure2: String?
    var measure3: String?
    var measure4: String?
    var measure5: String?
    var measure6: String?
    var measure7: String?
    var measure8: String?
    var measure9: String?
    var measure10: String?
    var measure11: String?
    var measure12: String?
    var measure13: String?
    var measure14: String?
    var measure15: String?
    var measure16: String?
    var measure17: String?
    var measure18: String?
    var measure19: String?
    var measure20: String?
    var source: String?
    
    private var ingredients: [String?] {
        var ingredients = [String?]()
        ingredients.append(ingredient1)
        ingredients.append(ingredient2)
        ingredients.append(ingredient3)
        ingredients.append(ingredient4)
        ingredients.append(ingredient5)
        ingredients.append(ingredient6)
        ingredients.append(ingredient7)
        ingredients.append(ingredient8)
        ingredients.append(ingredient9)
        ingredients.append(ingredient10)
        ingredients.append(ingredient11)
        ingredients.append(ingredient12)
        ingredients.append(ingredient13)
        ingredients.append(ingredient14)
        ingredients.append(ingredient15)
        ingredients.append(ingredient16)
        
        var result: [String?] = []
        
        for item in ingredients {
            if item != "" {
                result.append(item)
            }
        }
        return result
    }
    
    private var measures: [String?] {
        var ingredients = [String?]()
        ingredients.append(measure1)
        ingredients.append(measure2)
        ingredients.append(measure3)
        ingredients.append(measure4)
        ingredients.append(measure5)
        ingredients.append(measure6)
        ingredients.append(measure7)
        ingredients.append(measure8)
        ingredients.append(measure9)
        ingredients.append(measure10)
        ingredients.append(measure11)
        ingredients.append(measure12)
        ingredients.append(measure13)
        ingredients.append(measure14)
        ingredients.append(measure15)
        ingredients.append(measure16)
        
        var result: [String?] = []
        
        for item in ingredients {
            if item != " " && item != "" {
                result.append(item)
            }
        }
        return result
    }
    
    var ingredientString: [NSMutableAttributedString] {
        var result: [NSMutableAttributedString] = []
        
        for (measure, ingredient) in zip(measures, ingredients) {
            guard let measureString = measure,
                  measureString != "",
                  measureString != " ",
                  let ingredientString = ingredient,
                  ingredientString != "",
                  ingredientString != " "
            else { break }
            
            let attributedString = NSMutableAttributedString(string: "\(measureString) \(ingredientString)")
            attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: NSRange(location: 0, length: measureString.count))
            attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: measureString.count + 1, length: ingredientString.count))
            result.append(attributedString)
        }
        return result
    }
    
}
