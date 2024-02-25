//
//  ProfileTabBarView.swift
//  echo
//
//  Created by Dicka J. Lezama on 22/02/24.
//

import Foundation
import SwiftUI

enum ProfileTabs: Int {
    case statistics = 0
    case badges = 1
}

struct ProfileTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabList: [String] = ["Estadísticas", "Mis logros"]
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
