//
//  Onboarding.swift
//  echo
//
//  Created by Fernando Ahuatzin Gallardo on 24/02/24.
//
import SwiftUI
import UserNotifications
import CoreLocation

struct Onboarding: View {
    @State private var selectedIndex = 0
    @State private var onboardingCompleted = false

    var body: some View {
        if onboardingCompleted{
            MainScreenView()
        }
        else
        {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("ColorPrincipal").opacity(0.7), Color("ColorPrincipal").opacity(0.9), Color("ColorPrincipal")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                TabView(selection: $selectedIndex) {
                    WelcomeTab().tag(0)
                    ChallengesTab().tag(1)
                    ShareTab().tag(2)
                    ProfilePhotoTab(selectedIndex: $selectedIndex).tag(3)
                    NotificationsTab(selectedIndex: $selectedIndex).tag(4)
                    LocationPermissionTab().tag(5)
                    GoTab(onboardingCompleted: $onboardingCompleted).tag(6)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                VStack {
                    Spacer()
                    HStack(spacing: 8) {
                        ForEach(0..<7) { index in
                            Rectangle()
                                .frame(width: selectedIndex == index ? 20 : 8, height: 8)
                                .foregroundColor(selectedIndex == index ? Color.white : Color.gray)
                                .cornerRadius(4)
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
        
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Onboarding()
                .preferredColorScheme(.light)
        }
    }
}
// MARK: - LocationPermissionTab
struct LocationPermissionTab: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "location.fill")
                .font(.system(size: 190, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, -20)
            Text("Permitir acceso a ubicación")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.top, 20)
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
            Text("Necesitamos acceso a tu ubicación, para que puedas denunciar en donde te encuentras.")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .padding([.trailing, .leading, .bottom], 50)
            Spacer()
            Button("Permitir ubicación") {
                locationManager.requestLocationAuthorization()
            }
            .frame(width: 320, height: 50)
            .font(.system(size: 20, weight: .bold))
            .background(Color.white)
            .foregroundColor(Color("ColorPrincipal"))
            .cornerRadius(10)
            .padding(.bottom, 50)
        }
    }
}
// MARK: - WelcomeTab
struct WelcomeTab: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 350, height: 350)
                  .shadow(color: .black, radius: 5, x: 0, y: 2)
            Text("Bienvenido a Ecommunity")
                .font(.system(size: 48, weight: .bold)) // Hacer el título un poco más grande
                .foregroundColor(.white) // Color del texto
                .padding(.horizontal, 10)
                .padding(.top, 20) // Espacio reducido arriba del título
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
            Text("El lugar donde tú puedes hacer el cambio por tu comunidad")
                .font(.system(size: 20))
                .foregroundColor(.white) // Color del texto
                .bold()
                .multilineTextAlignment(.center)
                .padding([.trailing, .leading, .bottom], 50)
            
        }
    }
}

// MARK: - ChallengesTab
struct ChallengesTab: View {
    var body: some View {
        tabViewTemplate(imageName: "eye.trianglebadge.exclamationmark", title: "Denuncias", description: "¿Has notado algo que podría afectar al ambiente? Toma una foto, describe el problema y nosotros nos encargamos.")
    }
}

// MARK: - ShareTab
struct ShareTab: View {
    var body: some View {
        tabViewTemplate(imageName: "person.3.fill", title: "Elige un líder", description: "Sé o vota por una personas que llevará todos los casos relevantes al Ayuntamiento")
    }
}


// MARK: - GoTab
struct GoTab: View {
    @Binding var onboardingCompleted: Bool
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "megaphone")
                .font(.system(size: 180, weight: .bold))
                .rotationEffect(.degrees(-45))
            Text("¡Estás listo!")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal, 10)
                .padding(.top, 40)
                .padding(.bottom, 1)
            Button("Comenzar a participar") {
                onboardingCompleted = true
                        }
                            .frame(width: 320, height: 75)
                            .font(.system(size: 25, weight: .bold))
                            .background(Color.white)
                            .foregroundColor(Color("ColorPrincipal"))
                            .cornerRadius(10)
                            .padding(.top, 50)
                        Spacer()
            
        }
        
        .foregroundColor(.white)
    }
}

// MARK: - Notifications
struct NotificationsTab: View {
    @Binding var selectedIndex: Int
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 190, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, -20)
            Text("Activar notificaciones")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .padding([.horizontal], 10)
                .padding(.top, 20)
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
            Text("Mantente al día con las últimas noticias y actualizaciones activando las notificaciones.")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .padding([.trailing, .leading, .bottom], 50)
            Spacer()
            Button("Permitir notificaciones") {
                requestNotifications()
            }
            .frame(width: 320, height: 50)
            .font(.system(size: 20, weight: .bold))
            .background(Color.white)
            .foregroundColor(Color("ColorPrincipal"))
            .cornerRadius(10)
            .padding(.bottom, 50)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func requestNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            DispatchQueue.main.async {
                if granted {
                    alertTitle = "Notificaciones activadas"
                    alertMessage = "¡Gracias por activar las notificaciones! Ahora recibirás las últimas actualizaciones directamente."
                } else {
                    alertTitle = "Notificaciones Desactivadas"
                    alertMessage = "Has desactivado las notificaciones. Puedes cambiar esto en cualquier momento desde los ajustes de tu dispositivo."
                }
                showingAlert = true
                selectedIndex = (selectedIndex) % 6
            }
        }
    }
}

// MARK: - ProfilePhoto
struct ProfilePhotoTab: View {
    @Binding var selectedIndex: Int
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.system(size: 190, weight: .bold))
                .foregroundColor(.white)
                .padding(.bottom, -20)
            Text("Añadir foto de perfil")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .padding([.horizontal], 10)
                .padding(.top, 20)
                .padding(.bottom, 1)
                .multilineTextAlignment(.center)
            Text("Subir una foto puede ayudar a tu comunidad a reconocerte.")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .padding([.trailing, .leading, .bottom], 50)
            Spacer()
            Button("Seleccionar foto") {
                showingImagePicker = true
            }
            .frame(width: 320, height: 50)
            .font(.system(size: 20, weight: .bold))
            .background(Color.white)
            .foregroundColor(Color("ColorPrincipal"))
            .cornerRadius(10)
            .padding(.bottom, 50)
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $inputImage)
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        DispatchQueue.main.async {
            selectedIndex = (selectedIndex + 1) % 6
        }
    }
}


// MARK: - Reusable View Template
func tabViewTemplate(imageName: String, title: String, description: String) -> some View {
    VStack {
        Spacer()
        Image(systemName: imageName)
            .font(.system(size: 190, weight: .bold))
            .foregroundColor(.white)
            .padding(.bottom, -20)

        Text(title)
            .font(.system(size: 48, weight: .bold))
            .foregroundColor(.white) // Color del texto
            .padding(.horizontal, 10)
            .padding(.top, 20) // Espacio reducido arriba del título
            .padding(.bottom, 1)
            .multilineTextAlignment(.center)
        Text(description)
            .font(.system(size: 20))
            .foregroundColor(.white) // Color del texto
            .bold()
            .multilineTextAlignment(.center)
            .padding([.trailing, .leading, .bottom], 50)
        Spacer()
    }
    .tabItem {
        Image(systemName: "circle.fill")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
