//
//  FavoritesViewModel.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import Foundation
import Combine

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Restaurant] = []

    func toggleFavorite(_ restaurant: Restaurant) {
        if let index = favorites.firstIndex(where: { $0.id == restaurant.id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(restaurant)
        }
    }

    func isFavorite(_ restaurant: Restaurant) -> Bool {
        favorites.contains(where: { $0.id == restaurant.id })
    }

    func removeFavorite(at offsets: IndexSet) {
        favorites.remove(atOffsets: offsets)
    }
}

