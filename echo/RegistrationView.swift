//
//  RegisterView.swift
//  echo
//
//  Created by Andrea Lima Blanca on 25/02/24.
//


import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRegisterButtonDisabled: Bool = true

    var body: some View {
        VStack {
            Text("Registro")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            TextField("Nombre", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .onChange(of: name) { newValue in
                    checkFormValidity()
                }

            TextField("Correo Electrónico", text: $email)
                .padding()
                .keyboardType(.emailAddress)
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .onChange(of: email) { newValue in
                    checkFormValidity()
                }

            SecureField("Contraseña", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .onChange(of: password) { newValue in
                    checkFormValidity()
                }

            Button(action: registerUser) {
                Text("Registrarse")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(isRegisterButtonDisabled ? Color.gray : Color.blue)
                    .cornerRadius(15.0)
            }
            .disabled(isRegisterButtonDisabled)
        }
        .padding()
    }

    private func checkFormValidity() {
        isRegisterButtonDisabled = name.isEmpty || email.isEmpty || password.isEmpty
    }

    private func registerUser() {
        print("Registro completado para el usuario: \(name)")
        // Aquí iría la lógica de registro, como una llamada a una API.
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
