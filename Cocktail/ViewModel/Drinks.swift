//
//  Drinks 2.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//
import Foundation

@Observable
class Drinks {
    
    private struct Response: Codable {
        var drinks: [Drink]
    }
    
    var urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    
    var drinksArray: [Drink] = []
    
    var isLoading = false
    
    func getData() async {
        
        isLoading = true
        print("🕸️ We are accessing the url \(urlString)")
        // Create URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            isLoading = false
            return
        }
        
        do {
            // if issues in simulator to get data...
            // let configuration = URLSessionConfiguration.ephemeral
            // let session = URLSession(configuration: configuration)
            // let (data, _) = try await session.data(from: url)
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode JSON into data structure
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                print("😡 JSON ERROR: Could not decode returned JSON data")
                isLoading = false
                return
            }
            
            // Confirm data was decoded:
            print("😎 JSON returned! Drinks count: \(response.drinks.count)")
            // print("😎 JSON returned! Drinks id1: \(returned.drinks[0].id)")
            Task { @MainActor in
                self.drinksArray = response.drinks
                
                isLoading = false
            }
        } catch {
            isLoading = false
            print("😡 ERROR: Could not get data from \(urlString) \(error.localizedDescription)")
        }
    }
}
