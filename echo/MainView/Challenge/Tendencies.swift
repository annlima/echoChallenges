//
//  Tendencies.swift
//  echo
//
//  Created by iOS Lab on 04/03/24.
//

import SwiftUI

struct Tendency: View {
    var body: some View {
        ZStack
        {
            Rectangle()
                .foregroundStyle(Color.secondary)
            
        }
    }
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct Tendencies: View {
    var body: some View {
        Tendency()
    }
}

#Preview {
    Tendencies()
}
