//
//  NavigationViewController.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 09.05.2022.
//

import UIKit

protocol NavigationViewControllerDelegate {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    
    func openRecipeVC(with recipe: MealRecipeViewModel)
    func openFavouriteRecipesVC()
}

class NavigationViewController: UINavigationController, NavigationViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = .black
        
        setupMainViewController()
    }
    
    private func setupMainViewController() {
        let viewController = MainScreenViewController()
        viewController.setNavigationControllerDelegate(with: self)
        
        pushViewController(viewController, animated: true)
    }
    
    
    // MARK: - Navigation
    
    func openRecipeVC(with recipe: MealRecipeViewModel) {
        let recipeVC = RecipeViewController(recipeViewModel: recipe, nibName: nil, bundle: nil)
        recipeVC.setNavigationControllerDelegate(with: self)
        
        pushViewController(recipeVC, animated: true)
    }
    
    func openFavouriteRecipesVC() {
        let favouriteRecipesVC = FavouriteRecipesViewController(nibName: nil, bundle: nil)
        favouriteRecipesVC.setNavigationControllerDelegate(with: self)
        favouriteRecipesVC.title = "My favourite recipes"
        
        pushViewController(favouriteRecipesVC, animated: true)
    }
    
    
}
