//
//  test.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//


import SwiftUI

struct SelectButton: View {
    @Binding var isSelected: Bool
    @State var text: String
    
    var body: some View {
        ZStack {
            
            if isSelected {
                
                Text(text)
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .background(Color.colorPrincipal)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(.capsule)
                
            } else {
                
                Text(text)
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .foregroundStyle(Color.black)
                    .opacity(0.7)
                    .overlay {
                        Capsule()
                            .stroke(Color.colorPrincipal)
                    }
            }
        }
    }
}

struct SelectButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectButton(isSelected: .constant(false), text: "Option")
    }
}
