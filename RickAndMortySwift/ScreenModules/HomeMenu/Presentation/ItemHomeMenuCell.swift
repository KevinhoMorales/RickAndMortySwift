//
//  ItemHomeMenuCell.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

import UIKit

final class ItemHomeMenuCell: UICollectionViewCell {
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Category"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func setUpUI() {
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: 10)
        mainContainer.addSubview(characterImage)
        characterImage.fillSuperView()
        setUpGradientForTitle()
        mainContainer.addSubview(titleCategoryLabel)
        titleCategoryLabel.setContraints(right: mainContainer.rightAnchor,
                                         bottom: mainContainer.bottomAnchor,
                                         left: mainContainer.leftAnchor,
                                         pRight: 10,
                                         pBottom: 10,
                                         pLeft: 10)
        
    }
    
    private func setUpGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [0.6, 0.9]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    // MARK: - Actions
}

// MARK: - Extensions here
extension ItemHomeMenuCell: Reusable {
    
}
