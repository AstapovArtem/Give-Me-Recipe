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
    
    func openRecipeVC(with recipe: MealRecipeViewModel) {
        let recipeVC = RecipeViewController(recipeViewModel: recipe, nibName: nil, bundle: nil)
        recipeVC.setNavigationControllerDelegate(with: self)
        recipeVC.title = "\(recipe.name)"
        
        pushViewController(recipeVC, animated: true)
    }
    
    // MARK: - Navigation
    
    
    
}
