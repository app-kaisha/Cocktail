//
//  DetailView.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var drink: Drink
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var rating = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text(drink.strDrink)
                .font(.title)
                .foregroundStyle(.eggplant)
                .frame(maxWidth: .infinity)
            HStack(alignment: .top) {
                drinkImage
                
                VStack(alignment: .center) {
                    Text("Rating (1-10):")
                        .bold()
                        .foregroundStyle(.eggplant)
                    TextField("-", text: $rating)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Alcohol:")
                        .font(.title3).bold()
                        .foregroundStyle(.eggplant)
                    Text((drink.strAlcoholic)?.lowercased() == "alcoholic" ? "Yes" : "No")
                        .font(.title)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Glass Type:")
                        .font(.title3).bold()
                        .foregroundStyle(.eggplant)
                    Text(drink.strGlass ?? "")
                        .font(.title)
                }
                Spacer()
            }
            
            VStack(alignment: .leading){
                Text("Ingredients:")
                    .font(.title3).bold()
                    .foregroundStyle(.eggplant)
                Text("1 oz of awesomeness\n3oz of sauce\n2oz unicorn dust\n1 lemon slice")
                    .multilineTextAlignment(.leading)
            }
            
            VStack(alignment: .leading){
                Text("Recipe:")
                    .font(.title3).bold()
                    .foregroundStyle(.eggplant)
                ScrollView(showsIndicators: false) {
                    Text(drink.strInstructions ?? "")
                        .multilineTextAlignment(.leading)
                    
                }
            }
    
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(drink: Drink(id: "178358", strDrink: "Mango Mojito", strAlcoholic: "Alcoholic", strGlass: "Jar", strInstructions: "Squeeze the juice from 1½ limes and blend with the mango to give a smooth purée.\nCut the rest of the limes into quarters, and then cut each wedge in half again. Put 2 pieces of lime in a highball glass for each person and add 1 teaspoon of caster sugar and 5-6 mint leaves to each glass. Squish everything together with a muddler or the end of a rolling pin to release all the flavours from the lime and mint.\nDivide the mango purée between the glasses and add 30ml white rum and a handful of crushed ice to each one, stirring well to mix everything together. Top up with soda water to serve and garnish with extra mint, if you like.", strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/wfqmgm1630406820.jpg"))
    }
}


extension DetailView {
    
    var drinkImage: some View {
        
        let drinkURL = drink.strDrinkThumb ?? ""
        
        return AsyncImage(url: URL(string: drinkURL)) { phase in
            if let image = phase.image {
                // valid image
                image
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8, x: 5, y: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
            } else if phase.error != nil {
                // error - null returned
                Image(systemName: "questionmark.square.dashed")
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8, x: 5, y: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
            } else {
                ProgressView()
                    .tint(.red)
                    .scaleEffect(4)
            }
        }
        .frame(width: 220, height: 220)
    }
}
