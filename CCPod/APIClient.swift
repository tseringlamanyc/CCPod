//
//  APIClient.swift
//  CCPod
//
//  Created by Tsering Lama on 2/27/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation
import Alamofire
//import SnapKit
//import Kingfisher

struct APICLient {
    
    static func fetchCocktail(completion: @escaping (AFResult<Cocktail>) -> ()) {
        let endpointURL = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        
        guard let url = URL(string: endpointURL) else {
            return
        }
        
        AF.request(url).response { (response) in
//            response.error
//            response.request
//            response.data
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                
            }
        }
    }
}


