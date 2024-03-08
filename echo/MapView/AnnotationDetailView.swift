//
//  AnnotationDetailView.swift
//  echo
//
//  Created by Dicka J. Lezama on 03/03/24.
//

import SwiftUI

struct AnnotationDetailView: View {
    @Binding var annotation: ProblemAnnotation?

    var body: some View {
        if let annotation = annotation {
            VStack {
                ZStack(alignment: .top){
                    Image(annotation.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 393, alignment: .top)
                        .clipped()
                    LinearGradient(
                        stops: [
                            .init(color: Color(red: 0.38, green: 0.42, blue: 0.22).opacity(0.1), location: 0.00),
                            .init(color: Color(red: 0.97, green: 0.97, blue: 0.97).opacity(0.1), location: 0.83),
                            .init(color: .white, location: 1.00)
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                    )
                    .frame(width: 393)
                }
                .ignoresSafeArea(.all)
                .padding(.bottom)
               
                
            
                VStack (spacing: 0){
                    Text("\(annotation.title)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Text("\(annotation.description)")
                        .padding()
                    Text(annotation.address ?? "No se encontró dirección")
                        .opacity(0.8)
                }
                .padding(.bottom)
               
            }
            
            
        } else {
            Text("No annotation selected")
        }
    }

}
