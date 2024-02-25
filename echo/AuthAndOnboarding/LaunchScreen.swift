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

    
    let startingPoints: [CGPoint] = [
        CGPoint(x: 100, y: -100),
        CGPoint(x: 300, y: 200),
        CGPoint(x: 100, y: 400)
    ]

    var body: some View {
        ZStack {
            Color("ColorPrincipal")
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
        }
    }
}



struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
