//
//  Onboarding.swift
//  echo
//
//  Created by Fernando Ahuatzin Gallardo on 24/02/24.
//
import SwiftUI

struct Onboarding: View {
    @State private var selectedIndex = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorPrincipal").opacity(0.7), Color("ColorPrincipal").opacity(0.9), Color("ColorPrincipal")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection: $selectedIndex) {
                WelcomeTab().tag(0)
                ChallengesTab().tag(1)
                ShareTab().tag(2)
                BadgeTab().tag(3)
                GoTab().tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            VStack {
                Spacer()
                HStack(spacing: 8) {
                    ForEach(0..<5) { index in
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
            .foregroundColor(.white)
        Text(title)
            .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white) // Text color
            .padding([.horizontal], 10)
            .padding(.top, 40)
            .padding(.bottom, 1)
            .multilineTextAlignment(.center)
        Text(description)
            .font(.system(size: 20))
            .foregroundColor(.white) // Text color
            .bold()
            .multilineTextAlignment(.center)
            .padding([.trailing, .leading, .bottom], 50)
        Spacer()
    }
    .tabItem {
        Image(systemName: "circle.fill")
    }
}
