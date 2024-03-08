//
//  LaunchScreen.swift
//  echo
//
//  Created by Andrea Lima Blanca on 22/02/24.
//
import SwiftUI

struct GradientLeaf: View {
    var body: some View {
        Image(systemName: "leaf.fill")
            .foregroundColor(.white)
            .font(.system(size: 200))
            .frame(width: 60, height: 100)
    }
}

struct LaunchScreen: View {
    @State private var isFalling = false
    @State private var animationCompleted = false // Variable para controlar la transición

    let startingPoints: [CGPoint] = [
        CGPoint(x: 100, y: -100),
        CGPoint(x: 300, y: 200),
        CGPoint(x: 100, y: 400)
    ]

    var body: some View {
        // Condicional para cambiar entre la pantalla de lanzamiento y la pantalla principal
        if animationCompleted {
            RegistrationView()// Cambia esto por tu vista objetivo
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("ColorPrincipal").opacity(0.7), Color("ColorPrincipal").opacity(0.9), Color("ColorPrincipal")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ForEach(0..<3) { index in
                    GradientLeaf()
                        .rotationEffect(.degrees(isFalling ? 0 : 360))
                        .position(x: startingPoints[index].x, y: isFalling ? UIScreen.main.bounds.height + 200 : startingPoints[index].y)
                        .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isFalling)
                }
            }
            .onAppear {
                isFalling = true
                
                // Retrasa la actualización de animationCompleted para que coincida con la duración de tu animación
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Ajusta este tiempo según la duración de la animación
                    animationCompleted = true
                }
            }
        }
    }
}


struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LaunchScreen()
        }
       
    }
}
