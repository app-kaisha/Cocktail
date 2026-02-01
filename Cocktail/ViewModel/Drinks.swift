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
    
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "v", "w", "y", "z"]
    var alphabetIndex = 0
    let urlBase = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f="
    var urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    
    var drinksArray: [Drink] = []
    var count: Int { drinksArray.count }
    var isLoading = false
    
    func getData(letter: String) async {
        
        guard alphabetIndex < (alphabet.count) else { return }
        
        isLoading = true
        print("🕸️ We are accessing the url \(urlString)")
        // Create URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            isLoading = false
            return
        }
        
        do {
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
                self.drinksArray = self.drinksArray + response.drinks
                self.alphabetIndex += 1
                if alphabetIndex < (alphabet.count) {
                    self.urlString = self.urlBase + self.alphabet[alphabetIndex]
                }
                isLoading = false
            }
        } catch {
            isLoading = false
            print("😡 ERROR: Could not get data from \(urlString) \(error.localizedDescription)")
        }
    }
    
    func loadAllData() async {
        
        Task { @MainActor in
            // guard for end of range
            guard alphabetIndex < (alphabet.count) else { return }
            await getData(letter: alphabet[alphabetIndex])
            await loadAllData()
        }
    }
    
    func saveReview(drink: Drink) {
        guard let index = drinksArray.firstIndex(where: { $0.id == drink.id }) else {
            return
        }
        drinksArray[index].rating = drink.rating
    }
    
}
