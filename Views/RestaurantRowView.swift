//
//  RestaurantRowView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant
    var showNavigation = true

    @EnvironmentObject var favoritesVM: FavoritesViewModel

    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                Text(restaurant.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("⭐️ \(restaurant.rating, specifier: "%.1f")  •  \(restaurant.priceLevel)  •  \(restaurant.distance, specifier: "%.1f") mi")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                favoritesVM.toggleFavorite(restaurant)
            }) {
                Image(systemName: favoritesVM.isFavorite(restaurant) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 4)
    }
}

