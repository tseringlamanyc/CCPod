//
//  ViewController.swift
//  CCPod
//
//  Created by Tsering Lama on 2/27/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import Kingfisher

class CocktailVC: UIViewController {
    
    private let cocktailView = CocktailView()
    
    private lazy var swipeGesture: UISwipeGestureRecognizer = {
       let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(fetchData))
        gesture.direction = .left
        return gesture
    }()
    
    override func loadView() {
        view = cocktailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchData()
        cocktailView.cocktailImage.isUserInteractionEnabled = true
        cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
    }
    
    // shake to change
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            fetchData()
        }
    }
    
    // swipe gesture
    
    
    @objc
    private func fetchData() {
        APICLient.fetchCocktail { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("couldnt get \(appError)")
            case .success(let cocktail):
                DispatchQueue.main.async {
                    self?.updateUI(cocktail: cocktail)
                }
            }
        }
    }
    
    private func updateUI(cocktail: Cocktail) {
        guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
            return
        }
        cocktailView.nameLabel.text = cocktail.strDrink
        cocktailView.ingredientsLabel.text = cocktail.ingredients
        
        UIView.transition(with: cocktailView.cocktailImage, duration: 1.0, options: [.transitionCrossDissolve], animations: {
            self.cocktailView.cocktailImage.kf.setImage(with: imageURL)
        }, completion: nil)
    }
}
