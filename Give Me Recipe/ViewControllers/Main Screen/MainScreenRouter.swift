//
//  MainScreenRouter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainScreenRoutingLogic {
    var navigationViewControllerDelegate: NavigationViewControllerDelegate? { set get }
    
    func openRandomRecipe(from viewModel: MealRecipeViewModel)
    func openFavouritesRecipes()
}

class MainScreenRouter: NSObject, MainScreenRoutingLogic {
    
    var navigationViewControllerDelegate: NavigationViewControllerDelegate?
    
    weak var viewController: MainScreenViewController?
    
    
    // MARK: Routing
    
    func openRandomRecipe(from viewModel: MealRecipeViewModel) {
        navigationViewControllerDelegate?.openRecipeVC(with: viewModel)
    }
    
    func openFavouritesRecipes() {
        navigationViewControllerDelegate?.openFavouriteRecipesVC()
    }
    
}
