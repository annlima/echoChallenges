//
//  BadgeSymbol.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 0 / 255, green: 114 / 255, blue: 118 / 255)


    var body: some View {
            GeometryReader { geometry in
                Path { path in
                    // Constants to adjust the drawing
                    let width = min(geometry.size.width, geometry.size.height)
                    let coneHeight = width * 0.6
                    let coneWidth = width * 0.3
                    let diamondHeight = width * 0.25
                    let diamondWidth = width * 0.5
                    
                    // Calculate the center
                    let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    // Diamond top
                    let topOfDiamond = CGPoint(x: center.x, y: center.y - diamondHeight / 2 - coneHeight / 2)
                    
                    // Draw the diamond
                    path.move(to: topOfDiamond)
                    path.addLine(to: CGPoint(x: center.x - diamondWidth / 2, y: center.y - coneHeight / 2))
                    path.addLine(to: CGPoint(x: center.x, y: center.y - coneHeight / 2 + diamondHeight))
                    path.addLine(to: CGPoint(x: center.x + diamondWidth / 2, y: center.y - coneHeight / 2))
                    path.addLine(to: topOfDiamond)
                    
                    // Draw the cone
                    path.move(to: CGPoint(x: center.x - coneWidth / 2, y: center.y - coneHeight / 2))
                    path.addLine(to: CGPoint(x: center.x, y: center.y + coneHeight / 2))
                    path.addLine(to: CGPoint(x: center.x + coneWidth / 2, y: center.y - coneHeight / 2))
                    path.addLine(to: CGPoint(x: center.x - coneWidth / 2, y: center.y - coneHeight / 2))
                }
                .fill(BadgeSymbol.symbolColor)
                //.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }
        }
}
#Preview {
    BadgeSymbol()
}
