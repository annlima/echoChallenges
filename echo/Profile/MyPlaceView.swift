import SwiftUI
import MapKit

struct MyPlaceView: View {
    @Binding var myPlace: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var searchQuery = ""
    @State private var editMyPlaceLocation = false
    @State private var showingConfirmation = false
    @State private var searchResultCoordinate: CLLocationCoordinate2D?
    
    var body: some View {
        VStack {
            ZStack {
                Map(coordinateRegion: $region, annotationItems: [Location(coordinate: myPlace)]) { location in
                    MapPin(coordinate: location.coordinate ?? myPlace)
                }
                .ignoresSafeArea(.all)
                .onAppear {
                    region.center = myPlace
                    region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                }
                
                VStack {
                    Button(!editMyPlaceLocation ? "Cambiar locación" : "Dejar de editar") {
                        editMyPlaceLocation.toggle()
                    }
                    .buttonStyle(CustomeButtonStyle())
                    .frame(width: 300, height: 600, alignment: .bottom)
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
                    
                    if editMyPlaceLocation {
                        TextField("Search for a place", text: $searchQuery, onCommit: {
                            searchAddress()
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .padding()
                        
                    }
                        
                }
                
            }
            
        }
        .confirmationDialog("¿Cambiar Mi Casa?", isPresented: $showingConfirmation, actions: {
            Button("Yes") {
                if let newLocation = searchResultCoordinate {
                    myPlace = newLocation
                    region.center = newLocation
                    editMyPlaceLocation = false
                    
                    //Clear textfield
                    searchQuery = " "

                }

            }
            Button("No", role: .cancel) { }
        }, message: {
            Text("¿Deseas cambiar la locación de Mi Casa?")
        })
    }

    private func searchAddress() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery

        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            DispatchQueue.main.async {
                guard let coordinate = response?.mapItems.first?.placemark.coordinate else { return }
            self.searchResultCoordinate = coordinate
            self.region.center = coordinate
            self.showingConfirmation = true
            }
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D?
}



struct MyPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a default location for the preview
        MyPlaceView(myPlace: .constant(CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617)))
    }
}

