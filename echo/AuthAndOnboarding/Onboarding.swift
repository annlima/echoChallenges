//
//  Onboarding.swift
//  echo
//
//  Created by Fernando Ahuatzin Gallardo on 24/02/24.
//
import SwiftUI

struct Onboarding: View {
    var body: some View {
        ZStack {
            Color("ColorPrincipal")
                .edgesIgnoringSafeArea(.all)
            TabView {
                WelcomeTab()
                ChallengesTab()
                ShareTab()
                BadgeTab()
                GoTab()
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
            .preferredColorScheme(.light)
    }
}

// MARK: - WelcomeTab
struct WelcomeTab: View {
    var body: some View {
        tabViewTemplate(imageName: "leaf.fill", title: "Bienvenido a EcoChallenges", description: "El lugar donde tú y tus amigos hacen un cambio por el ambiente, demos un vistazo.")
    }
}

// MARK: - ChallengesTab
struct ChallengesTab: View {
    var body: some View {
        tabViewTemplate(imageName: "checkmark.circle.fill", title: "Retos", description: "Completa los retos diarios, semanales y mensuales, al hacer actividades relacionadas con el reciclaje.")
    }
}

// MARK: - ShareTab
struct ShareTab: View {
    var body: some View {
        tabViewTemplate(imageName: "person.3.fill", title: "Comparte", description: "Tras completar algun reto comparte tu logro con tus amigos y revisa quiénes igual lo completaron.")
    }
}

// MARK: - BadgeTab
struct BadgeTab: View {
    var body: some View {
        tabViewTemplate(imageName: "medal.fill", title: "Gana", description: "Sube de nivel al ir completando retos, y en el camino podrás ganar insignias.")
    }
}

// MARK: - GoTab
struct GoTab: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "leaf.fill")
                .font(.system(size: 180, weight: .bold))
                .rotationEffect(.degrees(45))
            Text("¡Estás listo!")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white) // Text color
                .padding(.horizontal, 10)
                .padding(.top, 40)
                .padding(.bottom, 1)
            Button("Comenzar a cumplir retos") {}
                .frame(width: 320, height: 75)
                .font(.system(size: 25, weight: .bold))
                .background(Color.white)
                .foregroundColor(Color("ColorPrincipal"))
                .cornerRadius(10)
                .padding(.top, 50)
            Spacer()
        }
        .foregroundColor(.white) // Ensure all text within is white
    }
}

// MARK: - Reusable View Template
func tabViewTemplate(imageName: String, title: String, description: String) -> some View {
    VStack {
        Spacer()
        Image(systemName: imageName)
            .font(.system(size: 180, weight: .bold))
            .foregroundColor(.white) // Image color
        Text(title)
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white) // Text color
            .padding([.horizontal], 10)
            .padding(.top, 40)
            .padding(.bottom, 1)
        Text(description)
            .font(.system(size: 20))
            .foregroundColor(.white) // Text color
            .padding([.trailing, .leading, .bottom], 50)
        Spacer()
    }
    .tabItem {
        Image(systemName: "circle.fill")
    }
}
