//
//  TopView.swift
//  homework_4_IATC_nzmasadov
//
//  Created by Nazim Asadov on 24.04.22.
//

import UIKit
import SnapKit

class TopView: UIView {

    private lazy var foodImgView : UIImageView = {
        let imgView = UIImageView()
                
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "ic_avocado")
        
        addSubview(imgView)
        return imgView
    }()
    
    private lazy var ratingView: UIView = {
        let view = UIView()
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 14
        view.backgroundColor = .white
        
        addSubview(view)
        return view
    }()
    
    private lazy var starImgView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "icStar")
        
        ratingView.addSubview(view)
        return view
    }()
    
    private lazy var ratingLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "5.0"
        
        ratingView.addSubview(label)
        return label
    }()
    
    private lazy var foodTitleLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.numberOfLines = 2
        label.text = "Avocado and Egg Toast"
        guard let customFont = UIFont(name: "Mulish-Bold", size: 20) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        addSubview(label)
        return label
    }()
    
    private lazy var subtitle : UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Medium", size: 14) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.numberOfLines = 3
        label.text = "You won't skip the most important meal of the \nday with this avocado toast recipe. Crispy, lacy \neggs and creamy avocado top hot buttered toast."
        
        addSubview(label)
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 1, green: 0.5619929433, blue: 0.2217679024, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Bold", size: 24) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "10.00"
        
        addSubview(label)
        return label
    }()
    
    private lazy var dollarLabel : UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 1, green: 0.5619929433, blue: 0.2217679024, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Bold", size: 14) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.text = "$"
        
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

        foodImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.left.equalToSuperview().offset(103)
            make.centerX.equalTo(snp.centerX)
            make.width.height.equalTo(170)
        }
        
        ratingView.snp.makeConstraints { make in
            make.right.equalTo(snp.right).offset(-31)
            make.top.equalTo(foodImgView.snp.top).offset(10)
            make.width.equalTo(58)
            make.height.equalTo(26)
        }
        
        starImgView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(9)
            make.top.equalToSuperview().offset(7)
            make.width.height.equalTo(12)
            make.centerY.equalTo(ratingView.snp.centerY)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImgView.snp.centerY)
            make.right.equalToSuperview().offset(-8)
        }
        
        foodTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(260)
            make.left.equalToSuperview().offset(24)
            make.width.equalTo(160)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-24)
            make.centerY.equalTo(foodTitleLabel.snp.centerY)
        }
        
        dollarLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.top).offset(4)
            make.right.equalTo(priceLabel.snp.left).offset(-1)
        }
        
        subtitle.snp.makeConstraints { make in
            make.left.equalTo(foodTitleLabel.snp.left)
            make.right.equalTo(priceLabel.snp.right)
            make.top.equalTo(foodImgView.snp.bottom).offset(135)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
}
