//
//  FeedView.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI
import CoreLocation


struct FeedView: View {
    
    private var newslist:[news] = [news(image: Image(.news3), description: "Contaminación y enfermedades agudizan por basurero en San Pedro Cholula", url: "https://www.e-consulta.com/nota/2024-02-12/medio-ambiente/contaminacion-y-enfermedades-agudizan-por-relleno-sanitario-en-san"),news(image: Image(.news2), description: "En Cholula, exigen cierre definitivo de tiradero porque contamina el agua", url: "https://www.elsoldepuebla.com.mx/local/en-cholula-exigen-cierre-definitivo-de-tiradero-porque-contamina-el-agua-11399164.html"),news(image: Image(.news1), description: "Socavón en Puebla: sobreexplotación de manto acuífero, una de las causas de su formación", url: "https://www.elfinanciero.com.mx/estados/2021/07/08/socavon-en-puebla-sobreexplotacion-de-manto-acuifero-una-de-las-causas-de-su-formacion/")]
    private var complaints: [Complaint] = [Complaint(title: "No hay denuncias aún",  text: ":(", photo: Image(systemName: "questionmark.app.dashed"), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417))]
    private var communityTendencies: [Tendency] = [Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104),Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104),Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104),Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104)]
    private var miniCommunityTendencies: [Tendency] = [Tendency(description: "La parada de autobús se ha convertido en basurero público", detailedDescription: "La parada de autobús de tu manzana de acuerdo a los vecinos se ha convertido en un basurero público.", image: Image(.tendency2),votes: 60),Tendency(description: "La parada de autobús se ha convertido en basurero público", detailedDescription: "La parada de autobús de tu manzana de acuerdo a los vecinos se ha convertido en un basurero público.", image: Image(.tendency2),votes: 60),Tendency(description: "La parada de autobús se ha convertido en basurero público", detailedDescription: "La parada de autobús de tu manzana de acuerdo a los vecinos se ha convertido en un basurero público.", image: Image(.tendency2),votes: 60), Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104)]
    @State private var currentTab: Int = options.zero.rawValue
    private var tabList: [String] = ["Comunidad", "Mini comunidad"]
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack{
                    Carousel(news: newslist)
                    electionTabBarView(currentTab: $currentTab,tabList: tabList)
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                        .padding(.top,100)
                        .padding()
                    switch currentTab {
                    case options.zero.rawValue:
                        ForEach(communityTendencies, id: \.self) { tendency in
                            NavigationLink (destination: ContributionView(tendency: tendency)){
                                TendencyView(tendency: tendency)
                                    .padding(.bottom)
                            }
                            .buttonStyle(.plain)
                            .shadow(color: .gray, radius: 5, x: 0, y:2)
                            
                                
                        }
                    case options.one.rawValue:
                        ForEach(miniCommunityTendencies, id: \.self) { tendency in
                            NavigationLink (destination: ContributionView(tendency: tendency)){
                                TendencyView(tendency: tendency)
                                    .padding(.bottom)
                            }
                            .buttonStyle(.plain)
                            .shadow(color: .gray, radius: 5, x: 0, y:2)

                            
                                
                        }
                    default:
                        EmptyView()
                    }
                    
                    
                    Spacer()
                    
                    
                }
            }
            
            
            
        }
    }
}


#Preview {
    FeedView()
}



