import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    @EnvironmentObject var favoritesVM: FavoritesViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 33.307575, longitude: -111.842104),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    private var pinLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 33.307575, longitude: -111.842104)
    }

    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.trailing, 8)
                }

                Text("Food Finder")
                    .font(.system(size: 50, weight: .bold))
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

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // MARK: - Title with Favorite
                    HStack {
                        Text("\(restaurant.name):")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(red: 1.0, green: 0.3, blue: 0.3))

                        Spacer()

                        Button(action: {
                            favoritesVM.toggleFavorite(restaurant)
                        }) {
                            Image(systemName: favoritesVM.isFavorite(restaurant) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                    }

                    // MARK: - Image + Info
                    HStack(alignment: .top, spacing: 12) {
                        Image("KazuRamen")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("⭐️⭐️⭐️⭐️☆")
                            Text(restaurant.priceLevel)
                                .font(.headline)
                            Text(restaurant.address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }

                    // MARK: - Description
                    Text("Serving ramen noodles and traditional dishes – teriyaki, katsu, sushi rolls – with a variety of Japanese sake and beer. Located in Gilbert, AZ.")
                        .font(.body)

                    // MARK: - Map
                    MapReader { proxy in
                        Map(position: $cameraPosition) {
                            Marker(restaurant.name, coordinate: pinLocation)
                        }
                        .frame(height: 200)
                        .cornerRadius(12)
                    }

                    // MARK: - Directions Button
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
        .navigationBarHidden(true)
    }

    private func openInMaps() {
        let placemark = MKPlacemark(coordinate: pinLocation)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = restaurant.name
        mapItem.openInMaps(launchOptions: nil)
    }
}
