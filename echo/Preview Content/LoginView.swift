//
//  LogInView.swift
//  echoChallenges
//
//  Created by Andrea Lima Blanca on 22/02/24.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var text: String
    @Binding var isSecure: Bool

    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("Contraseña", text: $text)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color("ColorPrincipal").opacity(0.20))
                    .cornerRadius(20)
            } else {
                TextField("Password", text: $text)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color("ColorPrincipal").opacity(0.2))
                    .cornerRadius(20)
            }
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(Color("ColorPrincipal"))
            }
            .padding(.trailing, 8)
        }
        .padding(.horizontal, 20)
    }
}

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showPassword: Bool = true
    
    let customGreen = Color(red: 162/255, green: 214/255, blue: 5/255)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Bienvenido")
                    .font(.largeTitle)
                    .font(.system(size: 12, weight: .light, design: .serif))
                    .bold() // Texto en negrita
                    .foregroundColor(customGreen)
                    .padding(.bottom, 0.5)
                Text("Regístrate ahora")
                    .font(.largeTitle)
                    .bold() // Texto en negrita
                    .foregroundColor(customGreen)
                    .padding(.top, 20)
                TextField("Nombre completo", text: $username)
                    .foregroundColor(.black)
                    .padding()
                    .background(customGreen.opacity(0.2))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)
                TextField("Nombre de usuario", text: $username)
                    .foregroundColor(.black)
                    .padding()
                    .background(customGreen.opacity(0.2))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .autocapitalization(.none)
                
                PasswordTextField(text: $password, isSecure: $showPassword)
        
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(customGreen)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                }
                
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
        }
        .opacity(isLoggedIn ? 0 : 1)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
