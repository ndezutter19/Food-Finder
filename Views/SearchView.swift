//
//  SearchView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

// This view represents the main screen where users search for dishes.
// It includes the app header, a search bar with filter and search buttons,
// and displays either search results or a placeholder message.

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // MARK: - App Header (Logo + Title)
                HStack {
                    Text("Food Finder")
                        .font(.system(size: 40, weight: .bold)) // Large, bold, italic title
                        .italic()
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Spacer()

                    Image("AppLogo") // Logo image from Assets.xcassets
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                .padding(.top, 0)         // Space below notch/Dynamic Island
                .padding(.horizontal)     // Left and right padding
                .padding(.bottom, 10)     // Padding below the header
                .background(Color(red: 1.0, green: 0.3, blue: 0.3)) // Red background

                // MARK: - Search Bar + Buttons
                HStack {
                    // Text input field for entering a food item to search
                    TextField("Search for food here", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 8)
                        .onSubmit {
                            viewModel.searchForDish() // Also triggers on "Return" key
                        }

                    // Magnifying glass button to trigger search
                    Button(action: {
                        viewModel.searchForDish()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding(10)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }

                    // Filter button (not yet implemented)
                    Button(action: {
                        print("Filter tapped")
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding(10)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemGray6)) // Light gray background for search section

                // MARK: - Search Results Section
                if viewModel.restaurants.isEmpty {
                    // Show a placeholder when no search results are available
                    Spacer()
                    Text("Results will appear here...Start Searching!")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                } else {
                    // Display list of restaurants once search results are available
                    List {
                        ForEach(Array(viewModel.restaurants.enumerated()), id: \.1.id) { index, restaurant in
                            // Only the first result is tappable to navigate to a detail view
                            if index == 0 {
                                NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
                                    RestaurantRowView(restaurant: restaurant, showNavigation: false)
                                }
                            } else {
                                RestaurantRowView(restaurant: restaurant)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarHidden(true) // Hides default navigation bar to use custom header
        }
    }
}
