//
//  IngredientsCollectionViewCell.swift
//  homework_4_IATC_nzmasadov
//
//  Created by Nazim Asadov on 24.04.22.
//

import UIKit

class IngredientsCollectionViewCell: UICollectionViewCell {
    static let identifier = "IngredientsCollectionViewCell"
    
    private lazy var imageView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.contentMode = .scaleAspectFit
        contentView.addSubview(imgView)
        
        return imgView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0.6252215505, green: 0.6284720302, blue: 0.7202073932, alpha: 1)
        label.textAlignment = .center
        guard let customFont = UIFont(name: "Mulish-Medium", size: 14) else {
            fatalError("Failed to load")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        contentView.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        clipsToBounds = true
        layer.cornerRadius = 16
        backgroundColor = .white
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(36)
            make.right.equalTo(contentView.snp.right).offset(-36)
            make.top.equalTo(contentView.snp.bottom).offset(12)
            make.centerX.equalTo(snp.centerX)
            make.width.height.equalTo(24)
        }
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalTo(imageView.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12)
            make.height.equalTo(20)
        }
    }
    
    func setTitle(_ title: String) {
        self.textLabel.text = title
    }
    
    func setImage(_ image: UIImage) {
        self.imageView.image = image
    }
    
}
