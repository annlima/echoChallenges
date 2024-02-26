//
//  ChallengeInfoView.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

struct ChallengeInfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var challenge: PChallenge
        
    var body: some View {
        VStack {
            Text(challenge.name)
                .font(.title)
                .padding()
                        
            Text(challenge.description)
                .padding()
            Spacer() // Keep the text centered
                
            NavigationLink(destination: CameraHome()) {
                Text("Completar reto") //acceso a camara
            }
            .padding()
            .background(Color.colorPrincipal)
            .cornerRadius(9)
            .padding(.top)
            .foregroundColor(Color.white)

        }
        .navigationBarTitle("Challenge Details", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
    }
}


