//
//  RecipeRouter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 08.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RecipeRoutingLogic {
    var navigationViewControllerDelegate: NavigationViewControllerDelegate? { set get }
}

class RecipeRouter: NSObject, RecipeRoutingLogic {
    
    var navigationViewControllerDelegate: NavigationViewControllerDelegate?
    
    weak var viewController: RecipeViewController?
    
    // MARK: Routing
    
}
