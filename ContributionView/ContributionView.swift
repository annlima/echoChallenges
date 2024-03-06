//
//  ContributionView.swift
//  echo
//
//  Created by iOS Lab on 06/03/24.
//

import SwiftUI

struct ContributionView: View {
    @State private var currentTab: Int = options.zero.rawValue
    private let tabList:  [String] = ["Votar","Agregar"]
    var tendency: Tendency
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView
                {
                    electionTabBarView(currentTab: $currentTab,tabList: tabList)
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                        .padding(.top,100)
                        .padding()
                    switch currentTab {
                    case options.zero.rawValue:
                        Text(tendency.detailedDescription)
                            .padding(.horizontal,50)
                            
                    case options.one.rawValue:
                        Text("view two")
                    default:
                        EmptyView()
                    }
                    HStack{
                        VStack{
                            Image(systemName: "chart.bar.fill")
                                .resizable()
                                .frame(width: 60,height: 40)
                                .foregroundColor(.colorPrincipal)
                            Text("\(tendency.votes) denuncias")
                        }
                        VStack{
                            Image(systemName: "doc.fill")
                                .resizable()
                                .frame(width: 40,height: 50)
                                .foregroundColor(.colorPrincipal)
                            Text("\(tendency.votes) denuncias")
                        }
                    }
                    
                }
            }
        }
        
        
        
    }
}

#Preview {
    ContributionView(tendency: Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104))
}
