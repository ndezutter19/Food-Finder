//
//  FavoritesViewModel.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import Foundation
import Combine

// ViewModel for managing the user's list of favorite restaurants.
// It handles adding, removing, and checking favorites.
class FavoritesViewModel: ObservableObject {
    // Published array of favorite restaurants to update the UI when changed
    @Published var favorites: [Restaurant] = []

    // Toggles a restaurant as a favorite:
    // If it’s already in the favorites list, remove it.
    // If it’s not, add it to the list.
    func toggleFavorite(_ restaurant: Restaurant) {
        if let index = favorites.firstIndex(where: { $0.id == restaurant.id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(restaurant)
        }
    }

    // Returns true if the restaurant is already marked as a favorite
    func isFavorite(_ restaurant: Restaurant) -> Bool {
        favorites.contains(where: { $0.id == restaurant.id })
    }

    // Removes a favorite using the swipe-to-delete gesture in a List
    func removeFavorite(at offsets: IndexSet) {
        favorites.remove(atOffsets: offsets)
    }
}
