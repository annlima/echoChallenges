//
//  ComplaintsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI
import MapKit
import CoreLocation



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
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            )
                        )
                    )
                ) {
                    Annotation("", coordinate: complaint.location.coordinate) {
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
                .scaledToFit()
            
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


extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
