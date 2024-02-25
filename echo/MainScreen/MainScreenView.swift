//
//  MainScreenView.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

var tabsIcons = ["lightbulb", "house", "person"]

struct MainScreenView: View {
    @EnvironmentObject var cameraModel: CameraViewModel

    @State var currentTab: Int = 0
    @State var selectedTab: Int = 0
    @State var profileTabSelectauthion: MainViewTabs = .challenges_tab
    
    var challengesViewModel = ChallengesViewModel(
        challenges: [
        DailyChallenge(id: "001", name: "Daily Challenge One", description: "This is the first daily challenge", startDate: Date(), points: 10),
        DailyChallenge(id: "002", name: "Daily Challenge Two", description: "This is the second daily challenge", startDate: Date(), points: 20),
        WeeklyChallenge(id: "003", name: "Weekly Challenge One", description: "This is the first weekly challenge", startDate: Date(), points: 20),
        MonthlyChallenge(id: "004", name: "Monthly Challenge One", description: "This is the first monthly challenge", startDate: Date(), points: 20)])

    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.colorPrincipal)
                        
                    }
                    
                     ZStack(alignment: .top) {
                         TabView(selection: self.$currentTab) {
                             MainViewTabBarView(currentTab: $currentTab)
                     
                             ChallengesView(viewModel: challengesViewModel)
                                 .tag(0)
                             
                             FeedView()
                                 .tag(1)
                            
                         }
                         .edgesIgnoringSafeArea(.all)
                         
                         MainViewTabBarView(currentTab: self.$currentTab)
                             .offset(y: 0)
                             .offset(x: 99)
                     }
                     
                }
                
            }
        }
    }
}

#Preview {
    MainScreenView()
}
