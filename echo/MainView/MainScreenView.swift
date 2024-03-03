//
//  MainScreenView.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

struct MainScreenView: View {
    @EnvironmentObject var cameraModel: CameraViewModel
    @State private var tabSelection: MainTabBarItem = .map

    //Declaración de retos de ejemplo
    var challengesViewModel = ChallengesViewModel(
        challenges: [
        DailyChallenge(id: "001", name: "Daily Challenge One", description: "This is the first daily challenge", startDate: Date(), points: 10),
        DailyChallenge(id: "002", name: "Daily Challenge Two", description: "This is the second daily challenge", startDate: Date(), points: 20),
        WeeklyChallenge(id: "003", name: "Weekly Challenge One", description: "This is the first weekly challenge", startDate: Date(), points: 20),
        MonthlyChallenge(id: "004", name: "Monthly Challenge One", description: "This is the first monthly challenge", startDate: Date(), points: 20)])

    var body: some View {
        NavigationView {
            MainTabBarContainerView(selection: $tabSelection) {
                
                MapView()
                    .mainTabBarItem(tab: .map, selection: $tabSelection)
                FeedView()
                    .mainTabBarItem(tab: .complaints, selection: $tabSelection)
                ProfileView()
                    .mainTabBarItem(tab: .profile, selection: $tabSelection)
                LeaderView()
                    .mainTabBarItem(tab: .leader, selection: $tabSelection)
            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
       MainScreenView()
    }
}

