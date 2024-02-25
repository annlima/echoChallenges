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
    
    var backButton: some View {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left") // Use a left-pointing chevron for the back button icon
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.colorPrincipal) // Color of the icon, change as needed
                    Text("Back")
                        .foregroundColor(.colorPrincipal) // Color of the text, change as needed
                }
                
            }
        }
        
        var body: some View {
            VStack {
                backButton
                    .padding()
                Spacer() // Ensure content is spaced out nicely
                Text(challenge.name)
                    .font(.title)
                    .padding()
                        
                Text(challenge.description)
                    .padding()
                Spacer() // Keep the text centered
                
                NavigationLink(destination: CameraHome()) {
                    Text("Completar reto")
                }
                .padding()
                .background(Color.colorPrincipal)
                .cornerRadius(9)
                .padding(.top)
                .foregroundColor(Color.white)

            }
            .navigationBarTitle("Challenge Details", displayMode: .inline)
            .navigationBarBackButtonHidden(true) // Hide the default back button
        }
    
}


