//
//  SearchViewModel.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import Foundation

// This ViewModel handles the business logic for the search screen.
// It stores the user's search input and manages the list of restaurants returned.

class SearchViewModel: ObservableObject {
    // The current text entered in the search bar
    @Published var searchText: String = ""

    // The list of restaurants matching the search query
    @Published var restaurants: [Restaurant] = []

    // Simulates searching for a dish by populating mock restaurant data.
    // In a real implementation, this would call an external API.
    func searchForDish() {
        restaurants = [
            Restaurant(
                name: "Kazu Ramen",
                address: "849 E Williams Field Rd Suite 105, Gilbert, AZ",
                rating: 4.6,
                priceLevel: "$$",
                distance: 1.2,
                isFavorite: false
            ),
            Restaurant(
                name: "Ramen #2",
                address: "Address 2",
                rating: 4.2,
                priceLevel: "$",
                distance: 2.0,
                isFavorite: false
            ),
            Restaurant(
                name: "Ramen #3",
                address: "Address 3",
                rating: 4.8,
                priceLevel: "$$$",
                distance: 3.5,
                isFavorite: false
            )
        ]
    }
}
