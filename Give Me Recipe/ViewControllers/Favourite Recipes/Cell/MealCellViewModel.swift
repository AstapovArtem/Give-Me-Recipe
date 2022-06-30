//
//  CellViewModel.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 30.06.2022.
//

import Foundation

class MealCellViewModel {
    var pictureUrlString: String
    var mealName: String
    var type: String
    var area: String
    
    init(pictureUrlString: String, mealName: String, type: String, area: String) {
        self.pictureUrlString = pictureUrlString
        self.area = area
        self.mealName = mealName
        self.type = type
    }
}
