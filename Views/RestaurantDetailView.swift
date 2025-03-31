import SwiftUI
import MapKit

// This view displays the detailed information for a selected restaurant,
// including its name, image, rating, address, location on the map,
// and a button to open directions in Apple Maps.
struct RestaurantDetailView: View {
    let restaurant: Restaurant

    // Access to the favorites view model to toggle/save favorite status
    @EnvironmentObject var favoritesVM: FavoritesViewModel

    // Environment variable to allow dismissing this view (for back navigation)
    @Environment(\.dismiss) private var dismiss

    // Map camera position — currently centered on a fixed location (mock location for now)
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 33.307575, longitude: -111.842104),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    // Static pin coordinate for map marker (will later be dynamic from API)
    private var pinLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 33.307575, longitude: -111.842104)
    }

    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Custom Header Bar with Back Button
            HStack {
                // Custom back button to dismiss the detail view
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.trailing, 8)
                }

                // App title
                Text("Food Finder")
                    .font(.system(size: 50, weight: .bold))
                    .italic()
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                Spacer()

                // App logo
                Image("AppLogo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }
            .padding(.top, 0)
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(Color(red: 1.0, green: 0.3, blue: 0.3))

            // MARK: - Scrollable Detail Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // MARK: - Restaurant Title with Heart (Favorite) Toggle
                    HStack {
                        Text("\(restaurant.name):")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(red: 1.0, green: 0.3, blue: 0.3))

                        Spacer()

                        // Favorite button (filled if already a favorite)
                        Button(action: {
                            favoritesVM.toggleFavorite(restaurant)
                        }) {
                            Image(systemName: favoritesVM.isFavorite(restaurant) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                    }

                    // MARK: - Restaurant Image + Quick Info Block
                    HStack(alignment: .top, spacing: 12) {
                        Image("KazuRamen") // Placeholder image from assets
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("⭐️⭐️⭐️⭐️☆") // Mock rating stars
                            Text(restaurant.priceLevel)
                                .font(.headline)
                            Text(restaurant.address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }

                    // MARK: - Restaurant Description (static for now)
                    Text("Serving ramen noodles and traditional dishes – teriyaki, katsu, sushi rolls – with a variety of Japanese sake and beer. Located in Gilbert, AZ.")
                        .font(.body)

                    // MARK: - Interactive Map with Marker
                    MapReader { proxy in
                        Map(position: $cameraPosition) {
                            Marker(restaurant.name, coordinate: pinLocation)
                        }
                        .frame(height: 200)
                        .cornerRadius(12)
                    }

                    // MARK: - Get Directions Button (opens Apple Maps)
                    Button(action: {
                        openInMaps()
                    }) {
                        HStack {
                            Text("Get Directions")
                                .fontWeight(.bold)
                            Image(systemName: "paperplane.fill")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(14)
                    }
                    .padding(.top, 10)
                }
                .padding()
            }

            Spacer()
        }
        .navigationBarHidden(true) // Hides native nav bar for custom layout
    }

    // Opens Apple Maps with the pinned location
    private func openInMaps() {
        let placemark = MKPlacemark(coordinate: pinLocation)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = restaurant.name
        mapItem.openInMaps(launchOptions: nil)
    }
}
