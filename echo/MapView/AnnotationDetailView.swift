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
                Text("\(annotation.title)")
                    .font(.title)
                    .padding()
                Text("Descripción del problema")
                    .font(.title3)
                Text("\(annotation.description)")
                    .padding()
                
            }
           
            
        } else {
            Text("No annotation selected")
        }
    }
}

