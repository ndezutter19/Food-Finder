//
//  RestaurantRowView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

// A reusable view that displays one restaurant in a list format.
// Includes the restaurant name, address, rating, and a heart icon to toggle favorites.

struct RestaurantRowView: View {
    let restaurant: Restaurant
    var showNavigation = true

    // Access the shared FavoritesViewModel to read/update favorites
    @EnvironmentObject var favoritesVM: FavoritesViewModel

    var body: some View {
        HStack {
            // Placeholder rectangle for future restaurant image
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            // Main restaurant info block (name, address, stats)
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

            // Heart icon to toggle favorite status
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
