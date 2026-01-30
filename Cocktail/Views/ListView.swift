//
//  ContentView.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @State private var drinks = Drinks()
    
    var body: some View {
        NavigationStack {
            List(drinks.drinksArray) { drink in
                NavigationLink {
                    DetailView(drink: drink.strDrink)
                } label: {
                    Text(drink.strDrink)
                        .font(.title)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Cocktails")
        }
        .task {
            await drinks.getData()
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
