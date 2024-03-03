//
//  BadgeSymbol.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

struct BadgeSymbol: View {
    
    var symbolColor: Color = Color(red: 0 / 255, green: 114 / 255, blue: 118 / 255)
    var width: CGFloat = 100

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // Constants to adjust the drawing
                //let width = min(geometry.size.width, geometry.size.height)
                let coneHeight = width * 0.6
                let coneWidth = width * 0.3
                let diamondHeight = width * 0.45
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
            .fill(symbolColor)
        }
    }
    
    
}

struct BadgeSymbolB: View {
    
    var symbolColor: Color = Color(red: 0 / 255, green: 114 / 255, blue: 118 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // Constants to adjust the drawing
                let width = min(geometry.size.width, geometry.size.height)
                let spadeHeight = width * 0.6
                let spadeWidth = width * 0.4
                let stemHeight = spadeHeight * 0.15
                let stemWidth = spadeWidth * 0.1
                let lobeWidth = spadeWidth / 2

                // Calculate the center
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)

                // Calculate the main points of the spade
                let bottomOfStem = CGPoint(x: center.x, y: center.y + spadeHeight * 0.45)
                let topOfSpade = CGPoint(x: center.x, y: center.y - spadeHeight * 0.55)
                let leftLobeControlPoint = CGPoint(x: center.x - lobeWidth, y: center.y - spadeHeight * 0.2)
                let rightLobeControlPoint = CGPoint(x: center.x + lobeWidth, y: center.y - spadeHeight * 0.2)

                // Start at the bottom of the stem
                path.move(to: CGPoint(x: center.x, y: bottomOfStem.y))

                // Draw the stem
                path.addRect(CGRect(x: center.x - stemWidth / 2, y: bottomOfStem.y, width: stemWidth, height: stemHeight))

                // Move to top of stem
                path.move(to: CGPoint(x: center.x, y: bottomOfStem.y - stemHeight))

                // Draw the left curve of the spade
                path.addCurve(to: topOfSpade,
                              control1: leftLobeControlPoint,
                              control2: topOfSpade)

                // Draw the right curve of the spade
                path.addCurve(to: CGPoint(x: center.x, y: bottomOfStem.y - stemHeight),
                              control1: topOfSpade,
                              control2: rightLobeControlPoint)

                // Close the path
                path.closeSubpath()
            }
            .fill(symbolColor)

        }
    }
}

#Preview {
    BadgeSymbol()
}
