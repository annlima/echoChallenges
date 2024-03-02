//
//  ReunionsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 02/03/24.
//

import SwiftUI
import Foundation

struct Reunion: Identifiable {
    let id = UUID()
    let date: Date
    let topic: String
    let result: String
}

struct ReunionsLeaderView: View {
    
    var reunion : Reunion = .test
    // let formattedDate = reunion.date.formatted(.iso8601.year().month().day())
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            
            Text(reunion.topic)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(reunion.date, style: .date)
            
            Text(reunion.result)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
    }
}

#Preview {
    ReunionsLeaderView()
        .environment(\.locale, Locale(identifier: "es"))
}

extension Reunion {
    
    static var test: Reunion {
        Reunion(
            date: Date.now,
            topic: "Más basureros en el parque",
            result: "Se acordaron poner 15 basureros más en el parque.")
    }
    
    static var none: Reunion {
        Reunion(
            date: Date.now,
            topic: "No hay juntas",
            result: "...")
    }
}
