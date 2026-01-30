//
//  DetailView.swift
//  Cocktail
//
//  Created by app-kaihatsusha on 30/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var drink: String
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var rating = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text(drink)
                .font(.title)
                .frame(maxWidth: .infinity)
            HStack(alignment: .top) {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 220, height: 220)
                    .scaledToFit()
                    .foregroundStyle(.black)
                VStack(alignment: .center) {
                    Text("Rating (1-10):")
                        .bold()
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
                    Text("yes")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Glass Type:")
                        .font(.title3).bold()
                    Text("Red Solo Cup")
                }
                Spacer()
            }
            
            VStack(alignment: .leading){
                Text("Ingredients:")
                    .font(.title3).bold()
                Text("1 oz of awesomeness\n3oz of sauce\n2oz unicorn dust\n1 lemon slice")
                    .multilineTextAlignment(.leading)
            }
            
            VStack(alignment: .leading){
                Text("Recipe:")
                    .font(.title3).bold()
                Text("Take a sunrise, sprinkle it with dew, cover it with chocolate and a miracle or two")
                    .multilineTextAlignment(.leading)
            }
    
            
            Spacer()
        }
        .foregroundStyle(.eggplant)
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
        DetailView(drink: "Mojito")
    }
}
