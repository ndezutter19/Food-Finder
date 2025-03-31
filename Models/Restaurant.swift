//
//  Restaurant.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import Foundation

// This struct defines a Restaurant model used throughout the app.
// It conforms to Identifiable so it can be used in SwiftUI lists and views.

struct Restaurant: Identifiable {
    // Unique identifier for each restaurant instance
    let id = UUID()

    // Name of the restaurant
    let name: String

    // Full address of the restaurant
    let address: String

    // Average rating (e.g., 4.5 stars)
    let rating: Double

    // Price level as a string (e.g., "$$", "$$$")
    let priceLevel: String

    // Distance from the user in miles
    let distance: Double

    // Indicates whether this restaurant is currently marked as a favorite
    let isFavorite: Bool
}
