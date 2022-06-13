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
    
    private let cellId = "cellId"
    
    // MARK: UI Elements
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = view.bounds
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        return scrollView
    }()
    
    private var contentSize: CGSize!
    
    private var mealNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = Constants.fontMealNameLabel
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    private var mealImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: Constants.mealImageHeight).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.mealImageHeight).isActive = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var typeMealLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = Constants.fontTexts
        typeLabel.numberOfLines = 1
        typeLabel.text = "Type label"
        return typeLabel
    }()
    
    private var typeMealImageView: UIImageView = {
        let typeImage = UIImageView()
        typeImage.translatesAutoresizingMaskIntoConstraints = false
        typeImage.widthAnchor.constraint(equalToConstant: Constants.generalInfoImagesHeight).isActive = true
        typeImage.heightAnchor.constraint(equalToConstant: Constants.generalInfoImagesHeight).isActive = true
        typeImage.image = UIImage(named: "foodType")
        let scale: CGFloat = 0.7
        typeImage.transform = CGAffineTransform(scaleX: scale, y: scale)
        return typeImage
    }()
    
    private var typeMealStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = Constants.generalLabelsSpacings
        return stackView
    }()
    
    private var countryMealLabel: UILabel = {
        let typeLabel = UILabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = Constants.fontTexts
        typeLabel.numberOfLines = 1
        typeLabel.text = "Country label"
        return typeLabel
    }()
    
    private var countryMealImageView: UIImageView = {
        let typeImage = UIImageView()
        typeImage.translatesAutoresizingMaskIntoConstraints = false
        typeImage.widthAnchor.constraint(equalToConstant: Constants.generalInfoImagesHeight).isActive = true
        typeImage.heightAnchor.constraint(equalToConstant: Constants.generalInfoImagesHeight).isActive = true
        typeImage.image = UIImage(named: "country")
        let scale: CGFloat = 0.7
        typeImage.transform = CGAffineTransform(scaleX: scale, y: scale)
        return typeImage
    }()
    
    private var countryMealStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = Constants.generalLabelsSpacings
        return stackView
    }()
    
    private var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ingredients"
        label.font = Constants.fontSectionLabel
        return label
    }()
    
    private var viewForTableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private var ingredientsTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPink
        tableView.rowHeight = Constants.ingredientTableViewCellHeight
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Instruction"
        label.font = Constants.fontSectionLabel
        return label
    }()
    
    private var instructionsTextView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.textAlignment = .left
        view.font = Constants.fontTexts
        view.backgroundColor = .clear
        view.isEditable = false
        view.sizeToFit()
        view.isScrollEnabled = false
        return view
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
    
    private func setupIngredientsTableView() {
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        
        ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        ingredientsTableView.frame = CGRect(x: 0, y: 0, width: 350, height: Int(Constants.ingredientTableViewCellHeight) * recipeViewModel.ingredientString.count)
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationViewController()
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        setupScrollView()
        setupMealNameLabel()
        setupMealImage()
        setupGeneralInfoLabels()
        setupIngredientsTableView()
        setupIngredientsUIElements()
        setupInstructionsUIElements()
        setDataForLabels()
    }
    
    // MARK: Display data
    
    func displayData(viewModel: Recipe.Model.ViewModel.ViewModelData) {
        switch viewModel {
            
        case .displayMealImage(image: let image):
            mealImage.image = UIImage(data: image)
            
        case .displayResultOfAddingFavouriteRecipe(reply: let reply):
            let alertController: UIAlertController
            if reply {
                alertController = createAlertController(title: "Success", message: "This recipe has added in your favourites!")
            } else {
                alertController = createAlertController(title: "Error", message: "Recipe hasn't added in your favourites. Try add again.")
            }
            present(alertController, animated: true)
        }
    }
    
    // MARK: Setup UI elements
    
    private func setupScrollView() {
        let sizeScrollView = CGSize(width: view.frame.width,
                                    height: RecipeViewHeightCalculated.viewSize(mealName: recipeViewModel.name,
                                                                                mealNameHeight: mealNameLabel.frame.height,
                                                                                instrustionTextHeight: instructionsTextView.frame.height,
                                                                                ingredientsCount: recipeViewModel.ingredientString.count))
        
        let sizeFromView = CGSize(width: view.frame.width, height: view.frame.height + navigationController!.navigationBar.frame.height)
        scrollView.contentSize = view.frame.height > sizeScrollView.height ? sizeFromView : sizeScrollView
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func setupNavigationViewController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFavouriteRecipe))
        
    }
    
    private func setupMealNameLabel() {
        scrollView.addSubview(mealNameLabel)
        mealNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.mealNameLabelWidthMultiplier).isActive = true
        mealNameLabel.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        mealNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Constants.mealNameTopAnchor).isActive = true
    }
    
    private func setupMealImage() {
        scrollView.addSubview(mealImage)
        mealImage.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: Constants.mealImageTopAnchor).isActive = true
        mealImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 150).isActive = true
    }
    
    private func setupGeneralInfoLabels() {
        scrollView.addSubview(typeMealStackView)
        
        typeMealStackView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: Constants.typeMealStackViewTopAnchor).isActive = true
        typeMealStackView.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        typeMealStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        
        typeMealStackView.addArrangedSubview(typeMealImageView)
        typeMealStackView.addArrangedSubview(typeMealLabel)
        
        scrollView.addSubview(countryMealStackView)
        countryMealStackView.topAnchor.constraint(equalTo: typeMealStackView.bottomAnchor, constant: Constants.countryMealStackViewTopAnchor).isActive = true
        countryMealStackView.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        countryMealStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.4).isActive = true
        
        countryMealStackView.addArrangedSubview(countryMealImageView)
        countryMealStackView.addArrangedSubview(countryMealLabel)
    }
    
    private func setupIngredientsUIElements() {
        scrollView.addSubview(ingredientsLabel)
        ingredientsLabel.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        ingredientsLabel.topAnchor.constraint(equalTo: mealImage.bottomAnchor, constant: Constants.ingredientsLabelTopAnchor).isActive = true
        
        scrollView.addSubview(viewForTableView)
        viewForTableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.85).isActive = true
        viewForTableView.sizeToFit()
        viewForTableView.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        viewForTableView.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: Constants.ingredientsTableViewTopAnchor).isActive = true
        
        viewForTableView.addSubview(ingredientsTableView)
        ingredientsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        ingredientsTableView.leadingAnchor.constraint(equalTo: viewForTableView.leadingAnchor).isActive = true
        ingredientsTableView.topAnchor.constraint(equalTo: viewForTableView.topAnchor).isActive = true
    }
    
    private func setupInstructionsUIElements() {
        scrollView.addSubview(instructionsLabel)
        instructionsLabel.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        instructionsLabel.topAnchor.constraint(equalTo: ingredientsTableView.bottomAnchor, constant: Constants.instructionsLabelTopAnchor).isActive = true
        
        scrollView.addSubview(instructionsTextView)
        instructionsTextView.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -scrollView.frame.width / 2.25).isActive = true
        instructionsTextView.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: Constants.instructionsTextViewTopAnchor).isActive = true
        instructionsTextView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: Constants.instructionTextViewWidthMultiplier).isActive = true
    }
    
    // MARK: Set real data for labels
    
    private func setDataForLabels() {
        mealNameLabel.text = recipeViewModel.name
        typeMealLabel.text = recipeViewModel.category
        countryMealLabel.text = recipeViewModel.area
        instructionsTextView.text = recipeViewModel.instructions
        
        if let urlString = recipeViewModel.picture {
            interactor?.makeRequest(request: .getDataMealImage(urlString: urlString))
        }
    }
    
    // MARK: Set NavigationViewControllerDelegate
    
    func setNavigationControllerDelegate(with delegate: NavigationViewControllerDelegate) {
        router?.navigationViewControllerDelegate = delegate
    }
    
    // MARK: Announce target functions
    
    @objc private func addFavouriteRecipe() {
        interactor?.makeRequest(request: .addFavouriteRecipe(viewModel: recipeViewModel))
    }
    
    // MARK: Supporting functions
    
    private func createAlertController(title: String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let buttonAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(buttonAction)
        
        return alertController
    }
}


extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeViewModel.ingredientString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .clear
        var content = cell.defaultContentConfiguration()
        
        let attributedString = recipeViewModel.ingredientString[indexPath.row]
        
        content.attributedText = attributedString
        content.image = UIImage(systemName: "square.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        cell.contentConfiguration = content
        return cell
    }
    
}
