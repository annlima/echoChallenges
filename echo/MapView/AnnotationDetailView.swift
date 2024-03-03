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
            Text("Title: \(annotation.title)\nDescription: \(annotation.description)\nCriticality: \(annotation.criticality.rawValue)")
        }
    }
}

