//
//  ProfileView.swift
//  echo
//
//  Created by Dicka J. Lezama on 22/02/24.
//

import SwiftUI

struct ProfileView: View {
    @State var currentTab: Int = 0
    @State var profileTabSelection: ProfileTabs = .statistics
    @State private var showMenu = false // For showing the action sheet
    @State private var navigateToSettings = false // To control navigation
    @State private var navigateToLogIn = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                    self.showMenu = true }) {
                        Image(systemName: "ellipsis")
                            .imageScale(.large)
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.colorPrincipal)
                    }
                    .actionSheet(isPresented: $showMenu) {
                        ActionSheet(title: Text("Opciones"), buttons: [
                                .default(Text("Configuraciones")) {
                                    self.navigateToSettings = true
                                },
                                .default(Text("Cerrar sesión")){
                                    self.navigateToLogIn = true
                                },
                                .cancel()
                        ])
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Circle()
                    .strokeBorder(Color.gray, lineWidth: 4) // Adds a border to the profile picture
                    .background(Circle().foregroundColor(.white))
                    .frame(width: 100, height: 100)
                    .shadow(radius: 10) // Adds a shadow for depth
                    .padding(.top, 50)
                
                HStack(spacing: 20) {
                    Text("Usuario")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("|")
                    
                    Text("Experiencia")
                        .font(.title3)
                }
                .padding(.top, 20)
                
                ZStack(alignment: .topLeading) {
                    TabView(selection: $currentTab) {
                        StatisticsView()
                            .tag(0)
                        
                        BadgesView()
                            .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides the default TabView indicator
                    .frame(height: 300) // Adjust based on your content
                    
                    // Custom tab bar view for switching tabs
                    ProfileTabBarView(currentTab: $currentTab)
                        .offset(y: -40)
                        .padding(.horizontal, 15)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.bottom, 20)
        }
        .navigationBarHidden(true)
        .background(
            NavigationLink(destination: SettingsView(), isActive: $navigateToSettings) {
                        EmptyView()
            }
        )
        .background(
            NavigationLink(destination: LoginView(), isActive: $navigateToLogIn) {
                        EmptyView()
            }
        )
    }
}



#Preview {
    ProfileView()
}

