//
//  SearchView.swift
//  FoodFinder
//
//  Created by Noah DeZutter on 3/30/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: - Header
                HStack {
                    Text("Food Finder")
                        .font(.system(size: 40, weight: .bold))
                        .italic()
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    Spacer()

                    Image("AppLogo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                }
                .padding(.top, 0)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .background(Color(red: 1.0, green: 0.3, blue: 0.3))

                // MARK: - Search + Filter
                HStack {
                    TextField("Search for food here", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 8)
                        .onSubmit {
                            viewModel.searchForDish()
                        }

                    Button(action: {
                        viewModel.searchForDish()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding(10)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }

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
                .background(Color(.systemGray6))

                // MARK: - Results
                if viewModel.restaurants.isEmpty {
                    Spacer()
                    Text("Results will appear here...Start Searching!")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(Array(viewModel.restaurants.enumerated()), id: \.1.id) { index, restaurant in
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
            .navigationBarHidden(true)
        }
    }
}
