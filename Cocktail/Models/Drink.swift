//
//  Drink.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
// https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a

import Foundation

struct Drink: Codable, Identifiable {
    var id: String
    var strDrink: String
    var strAlcoholic: String?
    var strGlass: String?
    var strInstructions: String?
    var strDrinkThumb: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case strDrink
        case strAlcoholic
        case strGlass
        case strInstructions
        case strDrinkThumb
    }

}
