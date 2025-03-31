//
//  FavoritesView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

// This view displays the user's list of favorite restaurants.
// If no favorites exist, it shows a message. Otherwise, it lists them,
// and allows the user to tap for details or swipe to delete.

struct FavoritesView: View {
    // Access the shared FavoritesViewModel from the environment
    @EnvironmentObject var favoritesVM: FavoritesViewModel

    var body: some View {
        NavigationView {
            VStack {
                // If no favorites have been saved, show a placeholder message
                if favoritesVM.favorites.isEmpty {
                    Spacer()
                    Text("No favorite restaurants yet!")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    // List of saved favorite restaurants
                    List {
                        ForEach(favoritesVM.favorites) { restaurant in
                            // Each row is a NavigationLink to the detailed view
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                RestaurantRowView(restaurant: restaurant, showNavigation: false)
                            }
                        }
                        // Swipe-to-delete functionality for removing favorites
                        .onDelete(perform: favoritesVM.removeFavorite)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarHidden(true) // Hide default nav bar to keep consistent UI
        }
    }
}
