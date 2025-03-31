//
//  ContentView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesVM = FavoritesViewModel()

    var body: some View {
        TabView {
            SearchView()
                .environmentObject(favoritesVM)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            FavoritesView()
                .environmentObject(favoritesVM)
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favorites")
                }
        }
    }
}


