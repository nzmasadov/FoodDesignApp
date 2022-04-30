import UIKit

class MainVC: UIViewController {
    
    let dishDetails: [DishDetailModel] = [
        DishDetailModel(value: "400", description: "kcal"),
        DishDetailModel(value: "510", description: "grams"),
        DishDetailModel(value: "30", description: "proteins"),
        DishDetailModel(value: "56", description: "carbs"),
        DishDetailModel(value: "24", description: "fats")
    ]
    
    let ingredients : [IngredientItems] = [
        IngredientItems(image: UIImage(named: "ic_egg")!, name: "Egg"),
        IngredientItems(image: UIImage(named: "ic_avocado1")!, name: "Avocado"),
        IngredientItems(image: UIImage(named: "ic_salad")!, name: "Spinach"),
        IngredientItems(image: UIImage(named: "ic_bread")!, name: "Bread"),
        IngredientItems(image: UIImage(named: "ic_egg")!, name: "Egg"),
        IngredientItems(image: UIImage(named: "ic_avocado1")!, name: "Avocado"),
        IngredientItems(image: UIImage(named: "ic_salad")!, name: "Spinach"),
        IngredientItems(image: UIImage(named: "ic_bread")!, name: "Bread")
    ]
    
    let toppings: [ToppingItems] = [
        ToppingItems(title: "Extra eggs", price: "$4.20"),
        ToppingItems(title: "Extra spinach", price: "$2.80"),
        ToppingItems(title: "Extra bread", price: "$1.80"),
        ToppingItems(title: "Extra tomato", price: "$2.10"),
        ToppingItems(title: "Extra cucumber", price: "$1.60"),
        ToppingItems(title: "Extra olives", price: "$3.50"),
        ToppingItems(title: "Extra pepper", price: "$1.50"),
        ToppingItems(title: "Extra avocado", price: "$5.40")
    ]
    
    private lazy var mainScrollView: UIScrollView = {
        let view = UIScrollView()
        
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        self.mainScrollView.addSubview(view)
        return view
    }()
    
    private lazy var topView: TopView = {
        let view = TopView()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        self.contentView.addSubview(view)
        
        return view
    }()
    
    private lazy var dishDetailStackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 2
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var ingredientsLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        label.text = "Ingredients"
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var ingredientsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        view.bounces = true
        view.alwaysBounceHorizontal = true
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.showsHorizontalScrollIndicator = false
        view.contentInset = .init(top: 12, left: 12, bottom: 12, right: 12)
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var toppingsLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        label.text = "Add toppings"
        
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var foodsTableView: UITableView = {
        let view = UITableView()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.separatorStyle = .none
        view.allowsSelection = false
        
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var requestLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 16) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        label.text = "Add request"
        
        self.contentView.addSubview(label)
        return label
    }()
        
    private lazy var bottomTextView: UITextView = {
        let view = UITextView()
        
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        guard let customFont = UIFont(name: "Mulish-Medium", size: 12) else {
            fatalError("Failed to load")
        }
        view.font = UIFontMetrics.default.scaledFont(for: customFont)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        view.layer.borderWidth = 0.4
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.text = "Ex: Don't add onion"
        view.textContainerInset = UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 16)
                
        contentView.addSubview(view)
        
        return view
    }()
    
    
    private lazy var characterLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = .lightGray
        guard let customFont = UIFont(name: "Mulish-Medium", size: 12) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .right
        label.numberOfLines = 1
        label.text = "0/250"
        label.backgroundColor = .white
        
        contentView.addSubview(label)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsCollectionView.delegate = self
        ingredientsCollectionView.dataSource = self
        
        foodsTableView.delegate = self
        foodsTableView.dataSource = self
        bottomTextView.delegate = self
        
        setupUI()
        
        ingredientsCollectionView.register(IngredientsCollectionViewCell.self, forCellWithReuseIdentifier: IngredientsCollectionViewCell.identifier)
        foodsTableView.register(FoodsTableViewCell.self, forCellReuseIdentifier: "topping_cell")
        
        dishDetails.forEach { dishes in
            let dishView = DishDetailView()
            dishView.configure(dishModel: dishes)
            dishDetailStackView.addArrangedSubview(dishView)
        }
    }
    

    
    func setupUI() {
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.mainScrollView.contentLayoutGuide.snp.top).offset(20)
            make.left.equalTo(self.mainScrollView.contentLayoutGuide.snp.left)
            make.right.equalTo(self.mainScrollView.contentLayoutGuide.snp.right)
            make.centerX.equalTo(self.mainScrollView.snp.centerX)
            make.bottom.equalTo(self.mainScrollView.contentLayoutGuide.snp.bottom)
            make.height.equalTo(1400)
        }
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(20)
            make.left.equalTo(self.contentView.snp.left)
            make.right.equalTo(self.contentView.snp.right)
            make.height.equalTo(400)
        }
        
        dishDetailStackView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(30)
            make.left.equalTo(contentView.snp.left).offset(24)
            make.right.equalTo(contentView.snp.right).offset(-24)
            make.height.equalTo(65)
        }
        
        ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(dishDetailStackView.snp.bottom).offset(30)
            make.left.equalTo(dishDetailStackView.snp.left)
            make.right.equalTo(dishDetailStackView.snp.right)
        }
        
        ingredientsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(12)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(100)
        }
        
        toppingsLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientsCollectionView.snp.bottom).offset(30)
            make.left.equalTo(contentView.snp.left).offset(24)
            make.right.equalTo(contentView.snp.right).offset(-24)
        }
        
        foodsTableView.snp.makeConstraints { make in
            make.top.equalTo(toppingsLabel.snp.bottom).offset(12)
            make.left.equalTo(toppingsLabel.snp.left)
            make.right.equalTo(contentView.snp.right).offset(-24)
            make.height.equalTo(500)
        }
        
        requestLabel.snp.makeConstraints { make in
            make.top.equalTo(foodsTableView.snp.bottom).offset(30)
            make.left.equalTo(toppingsLabel.snp.left)
            make.right.equalTo(toppingsLabel.snp.right)
        }
        
        bottomTextView.snp.makeConstraints { make in
            make.top.equalTo(requestLabel.snp.bottom).offset(12)
            make.left.equalTo(toppingsLabel.snp.left)
            make.right.equalTo(toppingsLabel.snp.right)
            make.height.equalTo(80)
        }
        
        characterLabel.snp.makeConstraints { make in
            make.top.equalTo(bottomTextView.snp.bottom).offset(-30)
            make.right.equalTo(bottomTextView.snp.right).offset(-10)
        }
    }
}


extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientsCollectionViewCell.identifier, for: indexPath) as! IngredientsCollectionViewCell
        
        cell.setTitle(ingredients[indexPath.row].name)
        cell.setImage(ingredients[indexPath.row].image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 92, height: 74)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toppings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "topping_cell", for: indexPath) as! FoodsTableViewCell
        cell.setTitle(toppings[indexPath.row].title, toppings[indexPath.row].price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(62)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if bottomTextView.text != "" && bottomTextView.text == "Ex: Don't add onion" {
            bottomTextView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if bottomTextView.text == "" {
            bottomTextView.text = "Ex: Don't add onion"
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count < 250 {
            characterLabel.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
            characterLabel.text = "\(textView.text.count)/250"
        }else {
            characterLabel.text = "250/250"
            characterLabel.textColor = .systemRed
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 250
    }
}
