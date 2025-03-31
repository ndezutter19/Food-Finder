//
//  Restaurant.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import Foundation

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let rating: Double
    let priceLevel: String
    let distance: Double
    let isFavorite: Bool
}
