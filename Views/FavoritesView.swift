//
//  FavoritesView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesVM: FavoritesViewModel

    var body: some View {
        NavigationView {
            VStack {
                if favoritesVM.favorites.isEmpty {
                    Spacer()
                    Text("No favorite restaurants yet!")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List {
                        ForEach(favoritesVM.favorites) { restaurant in
                            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                RestaurantRowView(restaurant: restaurant, showNavigation: false)
                            }
                        }
                        .onDelete(perform: favoritesVM.removeFavorite)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarHidden(true)
        }
    }
}


