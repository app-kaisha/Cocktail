//
//  ContentView.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    private var drinks = ["Swifty Sunrise", "Baldwin at the Beach", "Eagle Eggnog", "Mods Mudslide"]
    
    var body: some View {
        NavigationStack {
            List(drinks, id: \.self) { drink in
                NavigationLink {
                    DetailView(drink: drink)
                } label: {
                    Text(drink)
                        .font(.title)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Cocktails")
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
