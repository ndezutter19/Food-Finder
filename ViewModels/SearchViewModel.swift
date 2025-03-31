//
//  SearchViewModel.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var restaurants: [Restaurant] = []

    func searchForDish() {
        // Simulate API call with mock data
        restaurants = [
            Restaurant(name: "Kazu Ramen", address: "849 E Williams Field Rd Suite 105, Gilbert, AZ", rating: 4.6, priceLevel: "$$", distance: 1.2, isFavorite: false),
            Restaurant(name: "Ramen #2", address: "Address 2", rating: 4.2, priceLevel: "$", distance: 2.0, isFavorite: false),
            Restaurant(name: "Ramen #3", address: "Address 3", rating: 4.8, priceLevel: "$$$", distance: 3.5, isFavorite: false)
        ]
    }
}

