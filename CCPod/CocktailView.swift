//
//  CocktailView.swift
//  CCPod
//
//  Created by Tsering Lama on 2/27/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
    
    public var cocktailImage: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo")
        return iv
    }()
    
    public var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        return label
    }()
    
    public var ingredientsLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupImage()
        setUpName()
        setupIngredients()
    }
    
    private func setupImage() {
        addSubview(cocktailImage)
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    
    private func setUpName() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setupIngredients() {
        addSubview(ingredientsLabel)
        ingredientsLabel.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    
}
