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
    let about: String
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
    let experiences: [Experience]?
    let badges: [Int]
    
    
}


struct LeaderView: View {
    
    let profile: LeaderProfile = .test
    @State var text: String = ""
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var isShowingInfoView = false
    @State private var showNewPost = false
    @State private var showNewReunion = false
    @State private var isSelectedPosts = true
    @State private var isSelectedComplaint = false
    @State private var isSelectedReunions = false
    @State private var alertText = ""
    @State private var showingBadge = false
    
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
                            self.isShowingInfoView.toggle()
                        } label: {
                            Label("Más información", systemImage: "plus")
                                .padding(.horizontal, 10)
                                .frame(height: 35)
                                .opacity(0.8)
                                
                                .overlay {
                                    Capsule()
                                        .stroke(Color.colorPrincipal)
                                }
                            
                        }
                        .buttonStyle(.plain)
                        .sheet(isPresented: $isShowingInfoView, content: {
                            LeaderMoreInfoView(profile: profile)
                        })
                        
                    }
                    .padding(.top, 20)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        
                        Text("Insignias")
                            .font(.system(.title3, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                
                                ForEach(0 ..< profile.badges.count, id: \.self) { value in
                                    
                                    getBadge(type: value, width: 60)
                                        .frame(width: 60, height: 60)
                                        .alert(self.text, isPresented: $showingBadge) {
                                            Button("OK", role: .cancel) { }
                                            
                                        }
                                        .onTapGesture(perform: {
                                            self.text = getTypeBadge(type: value)
                                            self.showingBadge.toggle()
                                        })
                                    
                                }
                            }
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
        .overlay(
            Menu {
                Button{
                    self.showNewPost.toggle()
                } label: {
                    Text("Nuevo post")
                }
                Button{
                    self.showNewReunion.toggle()
                } label: {
                    Text("Nueva junta")
                }
                
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .frame(width: 60, height: 60)
            .background(Color.colorPrincipal)
            .cornerRadius(30)
            .shadow(radius: 10)
            .offset(x: -25, y: 10),
            alignment: .bottomTrailing
        )
        .sheet(isPresented: $showNewPost, content: {
            NewPostView()
        })
        .sheet(isPresented: $showNewReunion, content: {
            NewReunionView()
        })
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
            about: "Me gusta comer Sushi y ayudar a mi comunidad a solucionar problemas medio ambientales",
            backgroundPhoto: Image(.leaderBackground),
            profilePhoto: Image(.leaderPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 21,
            ig: "juan.perez01",
            tw: "juan.pp",
            fb: "juan.p1",
        
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
            ],
            experiences: [
                Experience.test,
                Experience.test
            ],
            badges: [0, 1, 2, 3, 4]
            
        )
    }
    
}
