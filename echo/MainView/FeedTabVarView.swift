//
//  FeedTabVarView.swift
//  echo
//
//  Created by iOS Lab on 06/03/24.
//

import Foundation
import SwiftUI

enum options: Int {
    case zero = 0
    case one = 1
}

struct electionTabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    @Environment(\.colorScheme) var colorScheme // detect color scheme

    var tabList: [String] //vistas
    var body: some View {
        
        HStack(spacing: 50) {
            ForEach(Array(zip(self.tabList.indices, self.tabList)),
                    id: \.0,
                    content: { index, name in
                TabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                    .frame(alignment: .center)
                    .frame(maxWidth: .infinity)

            })
        }
        .padding(.horizontal)
    }
}
