//
//  FoodsTableViewCell.swift
//  homework_4_IATC_nzmasadov
//
//  Created    by Nazim Asadov on 25.04.22.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {
    
    private lazy var checkboxImgView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.contentMode = .scaleAspectFill
        imgView.image = UIImage(named: "ic_checkbox")
        
        contentView.addSubview(imgView)
        
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Medium", size: 14) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 1
        
        contentView.addSubview(label)
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = #colorLiteral(red: 1, green: 0.5619929433, blue: 0.2217679024, alpha: 1)
        guard let customFont = UIFont(name: "Mulish-Bold", size: 14) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        contentView.addSubview(label)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor(named: "foregroundColor")
        backgroundColor = UIColor(named: "backgroundColor")
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 16
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imgTapped))
        contentView.addGestureRecognizer(gestureRecognizer)
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.right.equalTo(snp.right)
            make.left.equalTo(snp.left)
        }
        
        self.checkboxImgView.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(14)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-14)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.width.height.equalTo(20)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkboxImgView.snp.centerY)
            make.left.equalTo(self.checkboxImgView.snp.right).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(219)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(checkboxImgView.snp.centerY)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        
    }
    func setTitle(_ title: String, _ price: String ) {
        self.titleLabel.text = title
        self.priceLabel.text = price
    }
    
    @objc func imgTapped() {
        if checkboxImgView.image == UIImage(named: "ic_checkbox") {
            checkboxImgView.image = UIImage(named: "ic_checkboxFill")
        }else {
            checkboxImgView.image = UIImage(named: "ic_checkbox")
        }
    }
}
