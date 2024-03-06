//
//  ComplaintsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct Complaint: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let photo: Image
    let category: String
    let location: CLLocation
}

struct ComplaintsLeaderView: View {
    
    var complaint: Complaint = .test
    
    @State var city: String = "Ciudad"
    @State var country: String = "País"
    @State var isShowingMap = false

    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(complaint.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(complaint.text)
            
            Button {
                isShowingMap.toggle()
            } label: {
                Text(city + ", " + country)
                    .opacity(0.8)
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isShowingMap, content: {
                Text(city + ", " + country)
                    .font(.title2)
                    .bold()
                Map(position:
                    .constant(
                        MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: complaint.location.coordinate,
                                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                            )
                        )
                    )
                ) {
                    Annotation("Seattle", coordinate: complaint.location.coordinate) {
                                    Image(systemName: "mappin")
                                        .foregroundStyle(.red)
                                        .font(.title)
                                        .padding()
                                }
                }
                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 600)
            })
           
            
            complaint.photo
                .resizable()
                .frame(width: 300, height: 300)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .onAppear(perform: {
            complaint.location.fetchCityAndCountry{ city, country, _ in
                self.city = city ?? ""
                self.country = country ?? ""
            }
        })
        
    }
                                
}

#Preview {
    ComplaintsLeaderView()
}

extension Complaint {
    
    static var test: Complaint {
        Complaint(title: "Basura acumulada",  
                  text: "Hay basura acumulada en el terreno baldío",
                  photo: Image(.leaderBackground),
                  category: "low",
                  location: CLLocation(latitude: 37.785834, longitude: -122.406417)
            
        )
    }
    
    static var none: Complaint {
        Complaint(title: "No hay denuncias aún",  text: ":(", photo: Image(systemName: "questionmark.app.dashed"), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)
        )
    }
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}

// MapCameraPosition.region( MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
