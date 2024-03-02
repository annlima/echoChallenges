//
//  ComplaintsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI
import MapKit

struct Complaint: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let photo: Image
    let category: String
    let mapRegion: MapCameraPosition
}

struct ComplaintsLeaderView: View {
    
    var complaint: Complaint = .test
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(complaint.title)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(complaint.text)
            
            Map(position: .constant(complaint.mapRegion))
                .frame(maxWidth: .infinity, minHeight: 150, maxHeight: 200)
            
            complaint.photo
                .resizable()
                .frame(width: 300, height: 300)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
    }
}

#Preview {
    ComplaintsLeaderView()
}

extension Complaint {
    
    static var test: Complaint {
        Complaint(title: "Basura acumulada",  text: "Hay basura acumulada en el terreno baldío", photo: Image(.leaderBackground), category: "low", mapRegion: MapCameraPosition.region( MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
            
        )
    }
    
    static var none: Complaint {
        Complaint(title: "No hay denuncias aún",  text: ":(", photo: Image(systemName: "questionmark.app.dashed"), category: "low", mapRegion: MapCameraPosition.region( MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.406417), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
        )
    }
}
