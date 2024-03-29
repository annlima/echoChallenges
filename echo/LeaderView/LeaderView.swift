//
//  LeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI
import MapKit
import MessageUI


struct LeaderView: View {
    
    let profile: LeaderProfile = .fer
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
            
            ZStack(alignment: .top) {
                
                profile.backgroundPhoto
                    .resizable()
                    .frame(height: 170)
                    .ignoresSafeArea()
                    .padding(.bottom, 10)
                
                VStack(alignment: .center, spacing: 10) {
                    
                    profile.profilePhoto
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(.circle)
                        .padding(4)
                        .background {
                            Circle()
                                .strokeBorder(Color.gray, lineWidth: 4) // Adds a border to the profile picture
                                .background(Circle().foregroundColor(.white))
                                .frame(width: 150, height: 150)
                                .shadow(radius: 10) // Adds a shadow for depth
                        }
                        .padding(.top, 70)
                    
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
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
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
                                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                                }
                            
                        }
                        
                        .buttonStyle(.plain)
                        .sheet(isPresented: $isShowingInfoView, content: {
                            LeaderMoreInfoView(profile: profile)
                        })
                        
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Divider()
                        
                        Text("Insignias")
                            .font(.system(.title3, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                
                                ForEach(0 ..< profile.badges.count, id: \.self) { value in
                                    
                                    VStack {
                                        getBadge(type: profile.badges[value], width: 60)
                                            .frame(width: 60, height: 60)
                                            .shadow(color: .gray, radius: 1, x: 0, y: 2)
                                            .alert(self.text, isPresented: $showingBadge) {
                                                Button("OK", role: .cancel) { }
                                                
                                            }
                                            .onTapGesture(perform: {
                                                self.text = getAboutBadge(type: profile.badges[value])
                                                self.showingBadge.toggle()
                                            })
                                        
                                        Text(getTypeBadge(type: profile.badges[value]))
                                            .font(.caption)
                                            .bold()
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .frame(width: 90)
                                        
                                    }
                                    .padding(.horizontal, 4)
                                    
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
                                isSelectedPosts = true
                                
                                if isSelectedPosts {
                                    isSelectedComplaint = false
                                    isSelectedReunions = false
                                }
                                
                            }
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                            
                            SelectButton(
                                isSelected: $isSelectedComplaint,
                                text: "Denuncias")
                            .onTapGesture {
                                isSelectedComplaint = true
                                
                                if isSelectedComplaint {
                                    isSelectedPosts = false
                                    isSelectedReunions = false
                                }
                            }
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                            
                            SelectButton(
                                isSelected: $isSelectedReunions,
                                text: "Juntas")
                            .onTapGesture {
                                isSelectedReunions = true
                                
                                if isSelectedReunions {
                                    isSelectedPosts = false
                                    isSelectedComplaint = false
                                }
                            }
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
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
                
                Spacer()
                
            }

        }
        .ignoresSafeArea()
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
            .padding(20)
            ,
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
