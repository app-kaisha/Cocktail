//
//  CocktailApp.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

@main
struct CocktailApp: App {
    
    
    @State private var drinksVM = Drinks()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(drinksVM)
                .task {
                    await drinksVM.loadAllData()
                }
                .onAppear {

                    Thread.sleep(forTimeInterval: 1)
                }
        }
    }
}
