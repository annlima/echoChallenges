//
//  MainViewTabBar.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import Foundation
import SwiftUI

enum MainViewTabs: Int {
    case challenges_tab = 0
    case feed_tab = 1
}

struct MainViewTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabList: [String] = ["Retos", "Mi muro"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 50) {
                ForEach(Array(zip(self.tabList.indices, self.tabList)),
                        id: \.0,
                        content: { index, name in
                    TabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                })
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .frame(height: 100)
        .edgesIgnoringSafeArea(.all)
    }
}
