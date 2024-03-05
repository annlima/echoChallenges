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

