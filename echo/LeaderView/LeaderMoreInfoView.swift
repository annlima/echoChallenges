//
//  LeaderMoreInfoView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 02/03/24.
//

import SwiftUI


struct Experience: Identifiable {
    let id = UUID()
    let role: String
    let organization: String
    let date: String
}

struct Project: Identifiable {
    let id = UUID()
    let name: String
    let about: String
}


struct LeaderMoreInfoView: View {
    
    var profile: LeaderProfile = .test
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text(profile.name)
                        .font(.title)
                        .bold()
                    
                    Text(profile.about)
                    
                    HStack(spacing: 10) {
                        Text("Instagram")
                            .bold()
                        Text(profile.ig)
                    }
                    
                    HStack(spacing: 10) {
                        Text("Twitter")
                            .bold()
                        Text(profile.tw)
                    }
                    
                    HStack(spacing: 10) {
                        Text("Facebook")
                            .bold()
                        Text(profile.fb)
                    }
                    
                    Divider()
                    
                    Text("Experiencia")
                        .font(.title)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(profile.experiences ?? [Experience.none]) { experience in
                            Text(experience.role)
                                .bold()
                            
                            Text(experience.organization)
                            
                            Text(experience.date)
                            
                            Spacer()
                        }
                    }
                    
                    Divider()
                    
                    Text("Projectos")
                        .font(.title)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(profile.projects ?? [Project.none]) { project in
                            Text(project.name)
                                .bold()
                            
                            Text(project.about)
                            
                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LeaderMoreInfoView()
}

extension Experience {
    
    static var leader : Experience {
        Experience(role: "Lider de comunidad", organization: "Ecomunnity", date: "Febrero 2024 - presente")
    }
    
    static var service : Experience {
        Experience(role: "Servicio comunitario", organization: "UDLAP", date: "Agosto 2023 - presente")
    }
    
    static var none : Experience {
        Experience(role: "No hay experiencia", organization: "...", date: "..")
    }
    
}

extension Project {
    
    static var test : Project {
        Project(name: "Jardín en tu casa",
                about: "Este proyecto permite a los usuarios conocer más  ")
    }
    
    static var app : Project {
        Project(name: "Ecommunity",
                about: "Estre proyecto se enfoca en dejar a los usuarios crear ")
    }
    
    static var none : Project {
        Project(name: "No hay proyectos", about: "...")
    }
    
}
