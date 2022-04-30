//
//  DishDetailView.swift
//  homework_4_IATC_nzmasadov
//
//  Created by Nazim Asadov on 25.04.22.
//

import UIKit

class DishDetailView: UIView {

    private lazy var valueLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 0.2943825722, green: 0.2515707314, blue: 0.5450405478, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Bold", size: 14) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 1
        
        addSubview(label)
        return label
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.662745098, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Bold", size: 12) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.numberOfLines = 1
        
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.left.equalTo(snp.left).offset(10)
            make.right.equalTo(snp.right).offset(-5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(valueLabel.snp.bottom).offset(5)
            make.centerX.equalTo(valueLabel.snp.centerX)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
    }
    
    public func configure(dishModel: DishDetailModel) {
        self.valueLabel.text = dishModel.value
        self.descriptionLabel.text = dishModel.description
    }
}
