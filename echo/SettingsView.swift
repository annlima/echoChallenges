//
//  SettingsView.swift
//  echo
//
//  Created by Andrea Lima on 25/02/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Modo oscuro")
                    }
                    .onChange(of: isDarkMode) { _ in
                        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                    }
                }
                
                Section(header: Text("Sobre tu cuenta")) {
                    NavigationLink(destination: Text("Cambiar nombre de usuario")) {
                        Text("Cambiar nombre de usuario")
                    }
                    NavigationLink(destination: Text("Cambiar contraseña")) {
                        Text("Cambiar contraseña")
                    }
                }
                
                Section(header: Text("Más información")) {
                    NavigationLink(destination: Text("Sobre la app")) {
                        Text("Sobre la app")
                    }
                    NavigationLink(destination: Text("Aviso de Privacidad")) {
                        Text("Aviso de privacidad")
                    }
                }
            }
            .navigationBarTitle("Configuraciones")
        }
        Text("configuraciones van aquí :)")
    }
}


#Preview {
    SettingsView()
}
