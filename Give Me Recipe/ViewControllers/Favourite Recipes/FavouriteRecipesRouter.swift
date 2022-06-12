//
//  FavouriteRecipesRouter.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 07.06.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavouriteRecipesRoutingLogic {
    var navigationViewControllerDelegate: NavigationViewControllerDelegate? { set get }
}

protocol FavouriteRecipesDataPassing {
  
}

class FavouriteRecipesRouter: NSObject, FavouriteRecipesRoutingLogic {
    
  var navigationViewControllerDelegate: NavigationViewControllerDelegate?

  weak var viewController: FavouriteRecipesViewController?
  
  // MARK: Routing
  
}
