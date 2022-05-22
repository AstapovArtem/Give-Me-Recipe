//
//  RecipeViewController.swift
//  Give Me Recipe
//
//  Created by Artem Astapov on 19.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol RecipeDisplayLogic: class {
    func displayData(viewModel: Recipe.Model.ViewModel.ViewModelData)
}

class RecipeViewController: UIViewController, RecipeDisplayLogic {
    
    var interactor: RecipeBusinessLogic?
    var router: (NSObjectProtocol & RecipeRoutingLogic)?
    
    var recipeViewModel: MealRecipeViewModel!
    
    // MARK: UI Elements
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private var contentSize: CGSize { // Нужно будет сделать подсчет размера экрана в зависимости от размещаемого контента
        CGSize(width: view.frame.width, height: view.frame.height + 1000)
    }
    
    private var mealNameLabel: UILabel = {
       let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        nameLabel.numberOfLines = 3
        nameLabel.backgroundColor = .green
        nameLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        return nameLabel
    }()
    
    private var mealImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = CGFloat(imageView.frame.height / 2)
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return imageView
    }()
    
    private var typeMealLabel: UILabel = {
       let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.systemFont(ofSize: 20)
        typeLabel.numberOfLines = 1
        typeLabel.text = "Type label"
        return typeLabel
    }()
    
    private var typeMealImageView: UIImageView = {
       let typeImage = UIImageView()
        typeImage.translatesAutoresizingMaskIntoConstraints = false
        typeImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        typeImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        typeImage.image = UIImage(named: "foodType")
        return typeImage
    }()
    
    private var typeMealStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
//        stackView.alignment = .center
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.backgroundColor = .orange
        stackView.distribution = .fill
        return stackView
    }()
    
    private var countryMealLabel: UILabel = {
       let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.systemFont(ofSize: 20)
        typeLabel.numberOfLines = 1
        typeLabel.text = "Country label"
        return typeLabel
    }()
    
    private var countryMealImageView: UIImageView = {
       let typeImage = UIImageView()
        typeImage.translatesAutoresizingMaskIntoConstraints = false
        typeImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        typeImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        typeImage.image = UIImage(named: "country")
        return typeImage
    }()
    
    private var countryMealStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.backgroundColor = .purple
        return stackView
    }()
    
    // MARK: Object lifecycle
    
    init(recipeViewModel: MealRecipeViewModel, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.recipeViewModel = recipeViewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = RecipeInteractor()
        let presenter             = RecipePresenter()
        let router                = RecipeRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupLabels()
        setupMealImage()
        setupGeneralInfoLabels()
//        print(recipeViewModel.id)
//        print(recipeViewModel.ingredients.count)
//        print(recipeViewModel.measures.count)
    }
    
    func displayData(viewModel: Recipe.Model.ViewModel.ViewModelData) {
        
    }
    
    // MARK: Setup UI elements
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func setupLabels() {
        scrollView.addSubview(mealNameLabel)
        mealNameLabel.text = recipeViewModel.name
        mealNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 25).isActive = true
        mealNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        
    }
    
    private func setupMealImage() {
        scrollView.addSubview(mealImage)
        mealImage.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 5).isActive = true
        mealImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 150).isActive = true
    }
    
    private func setupGeneralInfoLabels() {
        scrollView.addSubview(typeMealStackView)
        
//        typeMealStackView.centerYAnchor.constraint(equalTo: mealImage.centerYAnchor, constant: -20).isActive = true
        typeMealStackView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 100).isActive = true
        typeMealStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        typeMealStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45).isActive = true
        
        typeMealStackView.addArrangedSubview(typeMealImageView)
        typeMealImageView.centerYAnchor.constraint(equalTo: typeMealStackView.centerYAnchor).isActive = true
        typeMealImageView.leadingAnchor.constraint(equalTo: typeMealStackView.leadingAnchor, constant: 5).isActive = true

        typeMealStackView.addArrangedSubview(typeMealLabel)
        typeMealLabel.centerYAnchor.constraint(equalTo: typeMealImageView.centerYAnchor).isActive = true
        typeMealLabel.leadingAnchor.constraint(equalTo: typeMealImageView.trailingAnchor, constant: 5).isActive = true
        
        scrollView.addSubview(countryMealStackView)
        countryMealStackView.topAnchor.constraint(equalTo: typeMealStackView.bottomAnchor, constant: 20).isActive = true
        countryMealStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        countryMealStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.45).isActive = true
        
        countryMealStackView.addArrangedSubview(countryMealImageView)
        
        countryMealStackView.addArrangedSubview(countryMealLabel)
    }
    
    // MARK: Set NavigationViewControllerDelegate
    
    func setNavigationControllerDelegate(with delegate: NavigationViewControllerDelegate) {
        router?.navigationViewControllerDelegate = delegate
    }
    
}
