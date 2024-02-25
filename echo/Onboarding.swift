//
//  Onboarding.swift
//  echo
//
//  Created by Fernando Ahuatzin Gallardo on 24/02/24.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        ZStack
        {
            Color("ColorPrincipal")
                .edgesIgnoringSafeArea(.all)
            TabView
            {
                WelcomeTab()
                ChallengesTab()
                ShareTab()
                BadgeTab()
                GoTab()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}



struct WelcomeTab: View {
    var body: some View {
        VStack
        {
            Spacer()
            //Intercambiar por logo o algo mas coherente
            Image(systemName: "leaf.fill")
                .font(.system(size: 180, weight: .bold))
                .rotationEffect(.degrees(45))
            Text("Bienvenido a EcoChallenges")
                .font(.system(size: 40, weight: .bold))
                .padding([.horizontal], 10)
                .padding([.top], 40)
                .padding([.bottom],1)
            Text("El lugar donde tú y tus amigos hacen un cambio por el ambiente, demos un vistazo.")
                .font(.system(size: 20, weight: .none))
                .padding([.trailing,.leading,.bottom], 50)
            Spacer()
        }
        .tabItem{
            Image(systemName: "circle.fill")
        }
    }
}
struct ChallengesTab: View {
    var body: some View {
        VStack
        {
            Spacer()
            //Intercambiar por la vista de los retos o algo asi
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 180, weight: .bold))
            Text("Retos")
                .font(.system(size: 40, weight: .bold))
                .padding([.horizontal], 10)
                .padding([.top], 40)
                .padding([.bottom],1)
            Text("Completa los retos diarios, semanales y mensuales, al hacer actividades relacionadas con el reciclaje.")
                .font(.system(size: 20, weight: .none))
                .padding([.trailing,.leading,.bottom], 50)
            Spacer()
        }
        .tabItem{
            Image(systemName: "circle.fill")
        }
    }
}
struct ShareTab: View {
    var body: some View {
        VStack
        {
            Spacer()
            //Intercambiar por algo relacionado con tomarte una foto y desbloquear las fotos de los demas
            Image(systemName: "person.3.fill")
                .font(.system(size: 180, weight: .bold))
            Text("Comparte")
                .font(.system(size: 40, weight: .bold))
                .padding([.horizontal], 10)
                .padding([.top], 40)
                .padding([.bottom],1)
            Text("Tras completar algun reto comparte tu logro con tus amigos y revisa quiénes igual lo completaron.")
                .font(.system(size: 20, weight: .none))
                .padding([.trailing,.leading,.bottom], 50)
            Spacer()
        }
        .tabItem{
            Image(systemName: "circle.fill")
        }
    }
}
struct BadgeTab: View {
    var body: some View {
        VStack
        {
            Spacer()
            //Intercambiar por algo las badges diseñadas
            Image(systemName: "medal.fill")
                .font(.system(size: 180, weight: .bold))
            Text("Gana")
                .font(.system(size: 40, weight: .bold))
                .padding([.horizontal], 10)
                .padding([.top], 5)
                .padding([.bottom],1)
            Text("Sube de nivel al ir completando retos, y en el camino podrás ganar insignias.")
                .font(.system(size: 20, weight: .none))
                .padding([.trailing,.leading,.bottom], 50)
            Spacer()
        }
        .tabItem{
            Image(systemName: "circle.fill")
        }
    }
}
struct GoTab: View {
    var body: some View {
        VStack
        {
            Spacer()
            Image(systemName: "leaf.fill")
                .font(.system(size: 180, weight: .bold))
                .rotationEffect(.degrees(45))
            Text("¡Estás listo!")
                .font(.system(size: 40, weight: .bold))
                .padding([.horizontal], 10)
                .padding([.top], 40)
                .padding([.bottom],1)
            Button("Comenzar a cumplir retos")
            {
                
            }
            .frame(width: 200, height: 70)
            .font(.system(size: 20, weight: .bold))
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding([.trailing,.leading,.top], 50)
            Spacer()
        }
        .tabItem{
            Image(systemName: "circle.fill")
        }
    }
}
