//
//  MainTabBarView.swift
//  echo
//
//  Created by Dicka J. Lezama on 25/02/24.
//

import SwiftUI

//tab bar view
struct MainTabBarView: View {
    let tabs: [MainTabBarItem]
    @Binding var tabSelection: MainTabBarItem
    @Namespace private var namespace
    @State var localSelection: MainTabBarItem
    @Environment(\.colorScheme) var colorScheme // detect color scheme

    
    var body: some View {
       MainTabBarVersion2
            .onChange(of: tabSelection) {
                withAnimation(.easeInOut) {
                    localSelection = tabSelection
                }
            }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static let tabs: [MainTabBarItem] = [.profile, .feed, .challenge]
    
    static var previews: some View {
        VStack {
            Spacer()
            MainTabBarView(tabs: tabs, tabSelection: .constant(tabs.first!), localSelection: tabs.first!)
        }
        
    }
}

extension MainTabBarView {
    private func tabView(tab: MainTabBarItem) -> some View {
        VStack(alignment: .center, spacing: 4) {
            
            Image(systemName: localSelection == tab ?  tab.selectedImage: tab.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text(tab.buttonText)
                
        }
        .foregroundColor(localSelection == tab ? tab.color1: Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }
    
    private func switchToTab (tab: MainTabBarItem) {
        tabSelection = tab
    }
}

extension MainTabBarView {
    private func MainTabView (tab: MainTabBarItem) -> some View {
        VStack(alignment: .center, spacing: 4) {
            
            Image(systemName: localSelection == tab ?  tab.selectedImage: tab.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Text(tab.buttonText)
        }
        .foregroundColor(localSelection == tab ? tab.color1: Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        /*
         .background(
             ZStack {
                 if localSelection == tab {
                     RoundedRectangle(cornerRadius: 10)
                         .fill(tab.color1.opacity(0.2))
                         .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                 }
             }
         )
         */
        
    }
    
    private var MainTabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                MainTabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(colorScheme == .dark ? Color.black.ignoresSafeArea(edges: .bottom) : Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(15)
        .shadow(color: colorScheme == .light ? Color.black.opacity(0.3) : Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
        .padding(.horizontal)
    }
}
