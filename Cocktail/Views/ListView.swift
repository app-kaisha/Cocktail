//
//  ContentView.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ListView: View {

    @Environment(Drinks.self) private var drinksVM
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                List (drinksVM.drinksArray) { drink in
                    LazyVStack {
                        NavigationLink {
                            DetailView(drink: drink)
                                .environment(drinksVM)
                        } label: {
                            HStack{
                                Text(drink.strDrink)
                                    .font(.title)
                                Spacer()
                                Text(drink.rating > 0 ? "\(drink.rating) " : "")
                                    .bold()
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Cocktails")
                .toolbar {
                    ToolbarItemGroup(placement: .status) {
                        Text("Drinks Shown: \(drinksVM.count)")
                    }
                }
            }
            
        }
    }
    
}

#Preview {
    NavigationStack {
        ListView()
            .environment(Drinks())
    }
}
