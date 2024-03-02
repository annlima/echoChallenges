//
//  LeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI
import MapKit
import MessageUI


// Leader definition
struct LeaderProfile {
    let name: String
    let headline: String
    let backgroundPhoto: Image
    let profilePhoto: Image
    let isVerified: Bool
    let location: String
    let age: Int
    let ig: String
    let tw: String
    let fb: String
    
    let posts: [Post]?
    let complaints: [Complaint]?
    let reunions: [Reunion]?
    
    
}


struct LeaderView: View {
    
    let profile: LeaderProfile = .test
    
    private let mailComposeDelegate = MailDelegate()
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    @State private var isSelectedPosts = true
    @State private var isSelectedComplaint = false
    @State private var isSelectedReunions = false
    @State private var showAlert = false
    @State private var alertText = ""
       
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                
                profile.backgroundPhoto
                    .resizable()
                    .frame(height: 150)
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 10) {
                    
                    profile.profilePhoto
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .clipShape(.circle)
                        .padding(4)
                        .background {
                            Circle()
                                .foregroundStyle(.background)
                        }
                    
                    HStack {
                        Text(profile.name)
                            .font(.title)
                            .bold()
                        
                        if profile.isVerified {
                            Image(systemName: "checkmark.shield")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    Text(profile.headline)
                        .multilineTextAlignment(.center)
                    
                    Text(profile.location)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    HStack(alignment: .top) {
                        
                        Button {
                            
                            if MFMailComposeViewController.canSendMail() {
                                self.isShowingMailView.toggle()
                            }
                            
                        } label: {
                            Label("Mensaje", systemImage: "envelope.fill")
                                .padding(.horizontal, 10)
                                .frame(height: 35)
                                .background(Color.colorPrincipal)
                                .foregroundStyle(.white)
                                .bold()
                                .clipShape(.capsule)
                        }
                        .sheet(isPresented: $isShowingMailView) {
                            MailView(isShowing: self.$isShowingMailView, result: self.$result)
                        }
                        
                        Button {
                            // ...
                        } label: {
                            Label("Más información", systemImage: "plus")
                                .padding(.horizontal, 10)
                                .frame(height: 35)
                                .foregroundStyle(Color.black)
                                .opacity(0.7)
                                .overlay {
                                    Capsule()
                                        .stroke(Color.colorPrincipal)
                                }
                            
                        }
                        
                    }
                    .padding(.top, 20)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Insignias")
                            .font(.system(.title3, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            Image(.leaderBackground)
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .topLeading)
                            
                            Image(.leaderBackground)
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .topLeading)
                        }
                        
                        Divider()
                        
                        Text("Contribuciones")
                            .font(.system(.title3, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            SelectButton(
                                isSelected: $isSelectedPosts,
                                text: "Posts")
                            .onTapGesture {
                                isSelectedPosts.toggle()
                                
                                if isSelectedPosts {
                                    isSelectedComplaint = false
                                    isSelectedReunions = false
                                }
                                
                            }
                            
                            SelectButton(
                                isSelected: $isSelectedComplaint,
                                text: "Denuncias")
                            .onTapGesture {
                                isSelectedComplaint.toggle()
                                
                                if isSelectedComplaint {
                                    isSelectedPosts = false
                                    isSelectedReunions = false
                                }
                            }
                            
                            SelectButton(
                                isSelected: $isSelectedReunions,
                                text: "Juntas")
                            .onTapGesture {
                                isSelectedReunions.toggle()
                                
                                if isSelectedReunions {
                                    isSelectedPosts = false
                                    isSelectedComplaint = false
                                }
                            }
                        }
                        
                        if isSelectedPosts {
                            
                            ForEach(profile.posts ?? [Post.none]) { post in
                                
                                VStack {
                                    PostsLeaderView(post: post)
                                    Divider()
                                }
                            }
                            
                        } else if isSelectedComplaint {
                            
                            ForEach(profile.complaints ?? [Complaint.none]) { complaint in
                                
                                VStack {
                                    ComplaintsLeaderView(complaint: complaint)
                                    Divider()
                                }
                            }
                            
                        } else if isSelectedReunions{
                            
                            ForEach(profile.reunions ?? [Reunion.none]) { reunion in
                                
                                VStack {
                                    ReunionsLeaderView(reunion: reunion)
                                    Divider()
                                }
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding()
                
            }
        }
    }
}


extension LeaderView {
    
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {

            func mailComposeController(_ controller: MFMailComposeViewController,
                                       didFinishWith result: MFMailComposeResult,
                                       error: Error?) {

                controller.dismiss(animated: true)
            }

        }

    // Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let composer = MFMailComposeViewController()
       
        composer.setToRecipients(["john.apleesed@icloud.com"])
        composer.setSubject("Hey there!")
        composer.setMessageBody("Hi, I'd like to know ", isHTML: false)
        composer.present(composer, animated: true)
    }
    
}

#Preview {
    LeaderView()
}

extension LeaderProfile {
    static var test: LeaderProfile {
        LeaderProfile(
            name: "Juan Pérez",
            headline: "Estudiante de Ing. Sistemas Computacionales @ UDLAP",
            backgroundPhoto: Image(.leaderBackground),
            profilePhoto: Image(.leaderPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 21,
            ig: "juan.perez01",
            tw: "juan",
            fb: "juan",
        
            posts: [
                Post.test,
                Post.test
            ],
            complaints: [
                Complaint.test,
                Complaint.test
            ],
            reunions: [
                Reunion.test,
                Reunion.test
            ]
            
            
        )
    }
}
