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
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
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
    }
}



#Preview {
    ProfileView()
}

