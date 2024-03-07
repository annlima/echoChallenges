//
//  SignedView.swift
//  echo
//
//  Created by iOS Lab on 07/03/24.
//

import SwiftUI

struct SignedView: View {
    var body: some View {
        ZStack
        {
            Color(.colorPrincipal)
                .ignoresSafeArea()
            VStack{
                Text("¡Gracias por alzar la voz y para hacer un cambio en tu comunidad!")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.system(size: 35, weight: .bold))
                    .multilineTextAlignment(.center)
                    
                Image(systemName: "person.bubble.fill")
                    .foregroundStyle(.white)
                    .font(.system(size: 190, weight: .bold))
                    
                
            }
        }
        
    }
}

#Preview {
    SignedView()
}
