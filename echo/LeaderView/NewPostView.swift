//
//  NewPostView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 06/03/24.
//

import SwiftUI
import PhotosUI


struct NewPostView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var text: String = ""
    @State private var photoItem: PhotosPickerItem?
    @State private var photoImage: Image?
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .center, spacing: 20) {
                
                Text("Nuevo Post")
                    .font(.title)
                    .bold()
                
                Divider()
                
                TextField("Escribe algo",
                          text: $text,
                          axis: .vertical
                    )
                
                HStack() {
                    
                    Spacer()
                    
                    PhotosPicker(selection: $photoItem, matching: .images) {
                        Label("", systemImage: "photo")
                            .foregroundColor(.colorPrincipal)
                            .font(.title)
                    }
                }
                
                photoImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
            }
            .onChange(of: photoItem) {
                Task {
                    if let loaded = try? await photoItem?.loadTransferable(type: Image.self) {
                        photoImage = loaded
                    } else {
                        print("Failed")
                    }
                }
            }
            .padding()
        }
        .padding()
        .overlay(
            Button {
                dismiss()
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.title)
                    .foregroundColor(.white)
                
            }
                .frame(width: 60, height: 60)
                .background(Color.colorPrincipal)
                .cornerRadius(30)
                .shadow(radius: 10)
                .offset(x: -25, y: 10),
            alignment: .bottomTrailing
        )
        
    }
}

#Preview {
    NewPostView()
}
