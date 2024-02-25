//
//  RegisterView.swift
//  echo
//
//  Created by Andrea Lima Blanca on 25/02/24.
//
import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var age = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Empecemos,", title2: "crea tu cuenta.")
            
            VStack(spacing: 20) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Correo electrónico",
                                 isSecureField: false, // Se especifica explícitamente para claridad, aunque el valor predeterminado ya es false
                                 text: $email)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "Nombre de usuario",
                                 isSecureField: false, // Opcional, ya que es el valor predeterminado
                                 text: $username)
                
                CustomInputField(imageName: "person",
                                 placeholderText: "Nombre completo",
                                 isSecureField: false, // Opcional, ya que es el valor predeterminado
                                 text: $fullname)
                CustomInputField(imageName: "number",
                                 placeholderText: "Edad",
                                 isSecureField: false, // Opcional, ya que es el valor predeterminado
                                 text: $age)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Contraseña",
                                 isSecureField: true, // Aquí se necesita para el campo de contraseña
                                 text: $password)
            }
            .padding(.horizontal, 30)
            .padding(.top, -20)
            
            Button {
                print("Registrado")
                // La lógica de registro sería manejada aquí
            } label: {
                Text("Regístrate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color("ColorPrincipal"))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("¿Ya tienes una cuenta?")
                        .font(.footnote)
                        .foregroundColor(Color("ColorPrincipal"))
                    Text("Inicia sesión")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("ColorPrincipal"))
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
