//
//  ProfileView.swift
//  echo
//
//  Created by Dicka J. Lezama on 22/02/24.
//

import SwiftUI

struct ProfileView: View {
    @State var currentTab: Int = 0
    @State var profileTabSelectauthion: ProfileTabs = .statistics
    
    var body: some View {
        ZStack {
            VStack{
                Circle()
                    .frame(width: 100, height: 100)
                    .padding(.top)
                                
                HStack {
                    Text("Username")
                    Text("Experience")
                }
                                    
                ZStack(alignment: .top) {
                    TabView(selection: self.$currentTab) {
                        ProfileTabBarView(currentTab: $currentTab)
                
                        StatisticsView()
                            .tag(0)
                        
                        BadgesView()
                            .tag(1)
                       
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    ProfileTabBarView(currentTab: self.$currentTab)
                        .offset(y: 0)
                        .offset(x: 15)
                }
                .navigationBarHidden(true)
            }
        }
        
    }
}


#Preview {
    ProfileView()
}

