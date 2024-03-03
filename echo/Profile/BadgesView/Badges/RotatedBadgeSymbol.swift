//
//  RotatedBadgeSymbol.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var width: CGFloat = 100
    var symbolColor: Color = Color(red: 0 / 255, green: 114 / 255, blue: 118 / 255)

    var body: some View {
        BadgeSymbol(symbolColor: symbolColor,
                    width: width
            )
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
