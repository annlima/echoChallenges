//
//  AuthHeaderView.swift
//  echo
//
//  Created by Andrea Lima Blanca on 25/02/24.
//

import SwiftUI

struct AuthHeaderView: View {
    var title1: String
    var title2: String
    
    var body: some View {
        ZStack {
            WaveShape()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("ColorPrincipal").opacity(0.5), Color("ColorPrincipal")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(height: 300)
                .edgesIgnoringSafeArea(.all) // Esto hace que la forma ondulada se extienda de esquina a esquina.
            
            VStack {
                Text(title1)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(title2)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .padding(.top, 40)
    }
}

struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let midPoint = rect.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0)) // Comienza en la esquina superior izquierda
        path.addLine(to: CGPoint(x: 0, y: rect.height - 40)) // Línea hacia abajo a la izquierda
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height - 40),
                          control: CGPoint(x: midPoint, y: rect.height + 40)) // Curva hacia la derecha
        path.addLine(to: CGPoint(x: rect.width, y: 0)) // Línea hacia arriba a la derecha
        
        return path
    }
}
