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
    
    func openRandomRecipe()
}

class MainScreenRouter: NSObject, MainScreenRoutingLogic {
    
    var navigationViewControllerDelegate: NavigationViewControllerDelegate?
    
    weak var viewController: MainScreenViewController?
    
    
    // MARK: Routing
    
    func openRandomRecipe() {
        let recipeVC = RecipeViewController()
        navigationViewControllerDelegate?.pushViewController(recipeVC, animated: true)
    }
    
}
