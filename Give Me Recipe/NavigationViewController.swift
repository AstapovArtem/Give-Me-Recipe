//
//  NavigationViewController.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 09.05.2022.
//

import UIKit

protocol NavigationViewControllerDelegate {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
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
    
    func openRecipeVC() {
        let recipeVC = RecipeViewController()
        recipeVC.navigationViewControllerDelegate = self
        
        pushViewController(recipeVC, animated: true)
    }
    
    // MARK: - Navigation
    
    
    
}
