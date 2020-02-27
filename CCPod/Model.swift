//
//  Model.swift
//  CCPod
//
//  Created by Tsering Lama on 2/27/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation

struct DrinksWrapper: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let strDrink: String
    let strDrunkThumb: String
}
