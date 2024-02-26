//
//  MainTabBarContainerView.swift
//  echo
//
//  Created by Dicka J. Lezama on 25/02/24.
//

import SwiftUI

//container
struct MainTabBarContainerView<Content: View>: View {
    
    @Binding var selection: MainTabBarItem
    let content: Content
    @State private var tabs: [MainTabBarItem] = []
    
    
    init(selection: Binding<MainTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            MainTabBarView(tabs: tabs, tabSelection: $selection, localSelection: selection)
            
        }
        .onPreferenceChange( MainTabBarItemsPreferenceKey.self, perform: {value in self.tabs = value})
    }
}

struct MainTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [MainTabBarItem] = []
    
    static var previews: some View {
        MainTabBarContainerView(selection: .constant(tabs.first!)) {
        }
    }
}
