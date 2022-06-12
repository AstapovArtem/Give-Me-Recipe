//
//  DataManager.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 10.06.2022.
//

import Foundation
import CoreData
import UIKit

class DataManager {
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentCotainer.viewContext
    }
    
    func addRecipeToFavourites(recipe: MealRecipeViewModel) -> Bool {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "MyFavouriteRecipe", in: context) else { return false }
        
        let recipeObject = MyFavouriteRecipe(entity: entity, insertInto: context)
        recipeObject.id = recipe.id
        recipeObject.name = recipe.name
        recipeObject.category = recipe.category
        recipeObject.area = recipe.area
        recipeObject.instructions = recipe.instructions
        recipeObject.picture = recipe.picture
        recipeObject.ingredient1 = recipe.ingredient1
        recipeObject.ingredient2 = recipe.ingredient2
        recipeObject.ingredient3 = recipe.ingredient3
        recipeObject.ingredient4 = recipe.ingredient4
        recipeObject.ingredient5 = recipe.ingredient5
        recipeObject.ingredient6 = recipe.ingredient6
        recipeObject.ingredient7 = recipe.ingredient7
        recipeObject.ingredient8 = recipe.ingredient8
        recipeObject.ingredient9 = recipe.ingredient9
        recipeObject.ingredient10 = recipe.ingredient10
        recipeObject.ingredient11 = recipe.ingredient11
        recipeObject.ingredient12 = recipe.ingredient12
        recipeObject.ingredient13 = recipe.ingredient13
        recipeObject.ingredient14 = recipe.ingredient14
        recipeObject.ingredient15 = recipe.ingredient15
        recipeObject.ingredient16 = recipe.ingredient16
        recipeObject.ingredient17 = recipe.ingredient17
        recipeObject.ingredient18 = recipe.ingredient18
        recipeObject.ingredient19 = recipe.ingredient19
        recipeObject.ingredient20 = recipe.ingredient20
        recipeObject.measure1 = recipe.measure1
        recipeObject.measure2 = recipe.measure2
        recipeObject.measure3 = recipe.measure3
        recipeObject.measure4 = recipe.measure4
        recipeObject.measure5 = recipe.measure5
        recipeObject.measure6 = recipe.measure6
        recipeObject.measure7 = recipe.measure7
        recipeObject.measure8 = recipe.measure8
        recipeObject.measure9 = recipe.measure9
        recipeObject.measure10 = recipe.measure10
        recipeObject.measure11 = recipe.measure11
        recipeObject.measure12 = recipe.measure12
        recipeObject.measure13 = recipe.measure13
        recipeObject.measure14 = recipe.measure14
        recipeObject.measure15 = recipe.measure15
        recipeObject.measure16 = recipe.measure16
        recipeObject.measure17 = recipe.measure17
        recipeObject.measure18 = recipe.measure18
        recipeObject.measure19 = recipe.measure19
        recipeObject.measure20 = recipe.measure20
        recipeObject.source = recipe.source
        
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getMyFavouriteRecipes() -> [MyFavouriteRecipe] {
        
        let context = getContext()
        let fetchRequest: NSFetchRequest<MyFavouriteRecipe> = MyFavouriteRecipe.fetchRequest()
        
        var recipes: [MyFavouriteRecipe] = []
        do {
            try recipes = context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return recipes
    }
    
    func deleteRecipeFromFavourites(id: String) {
        let context = getContext()
        
    }
}
