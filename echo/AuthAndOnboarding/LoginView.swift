//
//  LogInView.swift
//  echoChallenges
//
//  Created by Andrea Lima Blanca on 22/02/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Hola,", title2: "bienvenido de nuevo.")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Correo electrónico",
                                 isSecureField: false, // Se especifica explícitamente para claridad, aunque el valor predeterminado ya es false
                                 text: $email)
                CustomInputField(imageName: "lock",
                                 placeholderText: "Contraseña",
                                 isSecureField: true, // Aquí se necesita para el campo de contraseña
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset View")
                } label: {
                    Text("¿Olvidaste tu contraseña?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ColorPrincipal"))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                print("Inicia sesión")
                // Acción de inicio de sesión comentada
            } label: {
                Text("Inicia sesión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color("ColorPrincipal"))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("¿Aún no tienes un cuenta?")
                        .font(.footnote)
                    
                    Text("Regístrate")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color("ColorPrincipal"))
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
