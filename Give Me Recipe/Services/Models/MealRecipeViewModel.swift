//
//  MealViewModel.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 13.05.2022.
//

import Foundation

class MealsResponse {
    var meals: [MealRecipeViewModel?]
    
    init(meals: [MealRecipeViewModel?]) {
        self.meals = meals
    }
}


class MealRecipeViewModel {
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
    
    init(id: String,
         name: String,
         category: String,
         area: String,
         instructions: String,
         picture: String?,
         ingredient1: String?,
         ingredient2: String?,
         ingredient3: String?,
         ingredient4: String?,
         ingredient5: String?,
         ingredient6: String?,
         ingredient7: String?,
         ingredient8: String?,
         ingredient9: String?,
         ingredient10: String?,
         ingredient11: String?,
         ingredient12: String?,
         ingredient13: String?,
         ingredient14: String?,
         ingredient15: String?,
         ingredient16: String?,
         ingredient17: String?,
         ingredient18: String?,
         ingredient19: String?,
         ingredient20: String?,
         measure1: String?,
         measure2: String?,
         measure3: String?,
         measure4: String?,
         measure5: String?,
         measure6: String?,
         measure7: String?,
         measure8: String?,
         measure9: String?,
         measure10: String?,
         measure11: String?,
         measure12: String?,
         measure13: String?,
         measure14: String?,
         measure15: String?,
         measure16: String?,
         measure17: String?,
         measure18: String?,
         measure19: String?,
         measure20: String?,
         source: String?) {
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instructions = instructions
        self.picture = picture
        self.ingredient1 = ingredient1
        self.ingredient2 = ingredient2
        self.ingredient3 = ingredient3
        self.ingredient4 = ingredient4
        self.ingredient5 = ingredient5
        self.ingredient6 = ingredient6
        self.ingredient7 = ingredient7
        self.ingredient8 = ingredient8
        self.ingredient9 = ingredient9
        self.ingredient10 = ingredient10
        self.ingredient11 = ingredient11
        self.ingredient12 = ingredient12
        self.ingredient13 = ingredient13
        self.ingredient14 = ingredient14
        self.ingredient15 = ingredient15
        self.ingredient16 = ingredient16
        self.ingredient17 = ingredient17
        self.ingredient18 = ingredient18
        self.ingredient19 = ingredient19
        self.ingredient20 = ingredient20
        self.measure1 = measure1
        self.measure2 = measure2
        self.measure3 = measure3
        self.measure4 = measure4
        self.measure5 = measure5
        self.measure6 = measure6
        self.measure7 = measure7
        self.measure8 = measure8
        self.measure9 = measure9
        self.measure10 = measure10
        self.measure11 = measure11
        self.measure12 = measure12
        self.measure13 = measure13
        self.measure14 = measure14
        self.measure15 = measure15
        self.measure16 = measure16
        self.measure17 = measure17
        self.measure18 = measure18
        self.measure19 = measure19
        self.measure20 = measure20
        self.source = source
    }
}
