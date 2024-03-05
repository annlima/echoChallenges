//
//  FeedView.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                Carousel(imageNames: ["circle.fill","circle.fill","circle.fill","circle.fill"])
                Spacer()
                Text("Dos opciones de eso")
                
            }
            
            
        }
    }
}


#Preview {
    FeedView()
}



