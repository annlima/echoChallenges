//
//  ReunionsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 02/03/24.
//

import SwiftUI
import Foundation



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
