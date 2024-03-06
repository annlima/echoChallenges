//
//  NewReunionView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 06/03/24.
//

import SwiftUI

struct NewReunionView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var topic: String = ""
    @State private var results: String = ""
    @State private var date: Date = Date.now
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20) {
                
                Text("Nuevo Reporte de Junta")
                    .font(.title)
                    .bold()
                
                Divider()
                
                TextField("Tema",
                          text: $topic,
                          axis: .vertical
                    )
                
                DatePicker(
                        "Fecha",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                
                TextField("Resultados",
                          text: $results,
                          axis: .vertical
                    )
                
                
            }
            .padding()
        }
        .padding()
        .overlay(
            Button {
                dismiss()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.title)
                    .foregroundColor(.white)
                
            }
                .frame(width: 60, height: 60)
                .background(Color.colorPrincipal)
                .cornerRadius(30)
                .shadow(radius: 10)
                .offset(x: -25, y: 10),
            alignment: .bottomTrailing
        )
    }
}

#Preview {
    NewReunionView()
}
