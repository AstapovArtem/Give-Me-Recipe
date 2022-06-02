//
//  RecipeViewHeightCalculated.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 29.05.2022.
//

import Foundation
import UIKit

final class RecipeViewHeightCalculated {
    
    static func viewSize(mealName: String, mealNameHeight: CGFloat, instrustionTextHeight: CGFloat, ingredientsCount: Int) -> CGFloat {
        
        // MARK: Работа с mealNameLabel
        let mealNameLabelHeight = Constants.mealNameTopAnchor + mealNameHeight
        
        // MARK: Работа с mealImageHeight
        let mealImageHeight = Constants.mealImageTopAnchor + Constants.mealImageHeight
        
        // MARK: Работа с ingredientsTableView
        let totalIngredientsTableViewHeight = Constants.ingredientsLabelTopAnchor + Constants.aproximateSectionLabelsHeight + Constants.ingredientsTableViewTopAnchor + Constants.ingredientTableViewCellHeight * CGFloat(ingredientsCount)
        
        // MARK: Работа с instructions
        let totalInstructionHeight = Constants.instructionsLabelTopAnchor + Constants.aproximateSectionLabelsHeight + Constants.instructionsTextViewTopAnchor + instrustionTextHeight
        
        
        return mealNameLabelHeight + mealImageHeight + totalIngredientsTableViewHeight + totalInstructionHeight
    }
}
