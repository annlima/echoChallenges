//
//  BadgeEarnedView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 07/03/24.
//

import SwiftUI

struct BadgeEarnedView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var animationStarted = false
    
    var body: some View {
        
        ZStack {
            Color.white
            
            ForEach(0..<8) { index in
                RotatedBadgeSymbol2(
                    angle: .degrees(Double(index) / Double(5) * 360.0 + 35.0),
                    width: 500
                )
                .foregroundColor(.green)
                .rotationEffect(.degrees(self.animationStarted ? 0 : -50))
                .scaleEffect(self.animationStarted ? 1 : 5)
                .animation(.default).onAppear{
                    self.animationStarted = true
                }
            }
            .opacity(0.5)
            
            ForEach(0..<8) { index in
                RotatedBadgeSymbol2(
                    angle: .degrees(Double(index) / Double(5) * 360.0 + 17.5),
                    width: 500
                )
                .foregroundColor(.white)
                .rotationEffect(.degrees(self.animationStarted ? 0 : -50))
                .scaleEffect(self.animationStarted ? 1 : 5)
                .animation(.default).onAppear{
                    self.animationStarted = true
                }
            }
            .opacity(0.5)
            
            ForEach(0..<8) { index in
                RotatedBadgeSymbol2(
                    angle: .degrees(Double(index) / Double(5) * 360.0),
                    width: 500
                )
                .foregroundColor(.green)
                .rotationEffect(.degrees(self.animationStarted ? 0 : -50))
                .scaleEffect(self.animationStarted ? 1 : 5)
                .animation(.default).onAppear{
                    self.animationStarted = true
                }
            }
            .opacity(0.5)
            
            ForEach(0..<8) { index in
                RotatedBadgeSymbol2(
                    angle: .degrees(Double(index) / Double(5) * 360.0 - 17.5),
                    width: 500
                )
                .foregroundColor(.white)
                .rotationEffect(.degrees(self.animationStarted ? 0 : -50))
                .scaleEffect(self.animationStarted ? 1 : 5)
                .animation(.default).onAppear{
                    self.animationStarted = true
                }
            }
            .opacity(0.5)
            
            ZStack(alignment: .top) {
                
                
                VStack(alignment: .center, spacing: 10) {
                    
                    Text("Felicidades")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text("Has hecho 10 denuncias")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                }
                .padding(.vertical, 120)
                
                getBadge(type: 10, width: 500)
                    .transition(.scale)
                    .rotationEffect(.degrees(self.animationStarted ? 0 : -50))
                    .scaleEffect(self.animationStarted ? 1 : 5)
                    .animation(.default).onAppear{
                        self.animationStarted = true
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.vertical, 20)
                
                VStack(alignment: .center, spacing: 10) {
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Compartir")
                    }
                    .buttonStyle(CustomeButtonStyle())
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
                    .foregroundColor(Color("ColorPrincipal"))
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Continuar")
                            .foregroundColor(.black)
                    }
                    .buttonStyle(.plain)
                    .padding(.vertical, 20)
                }
            }

        }.ignoresSafeArea()
        
        
    }
}

#Preview {
    BadgeEarnedView()
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: 500, y: 500))
            path.addLine(to: CGPoint(x: 250, y: 500))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct RotatedBadgeSymbol2: View {
    let angle: Angle
    var width: CGFloat = 100

    var body: some View {
        Triangle()
            .frame(width: 100, height: 100)
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

/*
var badgeSymbols: some View {
    ForEach(0..<8) { index in
        RotatedBadgeSymbol2(
            angle: .degrees(Double(index) / Double(8)) * 360.0,
            width: width,
            symbolColor: symbolColor
        )
    }
    .opacity(0.5)
}*/
