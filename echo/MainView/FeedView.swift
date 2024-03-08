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
    private var complaints:[Complaint]
    private var complaintsF:[Complaint]
    private var complaintsI:[Complaint]
    private var complaintsG:[Complaint]
    private var communityTendencies: [Tendency]
    private var miniCommunityTendencies: [Tendency]
    
    init()
    {
        self.complaints =
        [Complaint(title: "Basura acumulada",  text: "Durante 3 semanas no han recogido la basura", photo: Image(.basura1), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Basura en la calle",  text: "La cuadra de mi casa ha acumulado mucha basura", photo: Image(.basura2), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Basura en la esquina",  text: "En la esquina del parque no han recogido la basura", photo: Image(.tendency1), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417))]
        self.complaintsF =
        [Complaint(title: "Incendio por cigarro",  text: "El empleado de protección civil comentó que el incendio fue por un cigarro", photo: Image(.fire3), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Combustión de pastizal",  text: "En la calle 5 de mayo", photo: Image(.fire2), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Incendio en pastizal",  text: "Por quema de basura se quemó un terreno de mi avenida", photo: Image(.fire1), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Quema de basura",  text: "Causó incendio en baldío de la 5 sur", photo: Image(.tendency3), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417))]
        self.complaintsI =
        [Complaint(title: "Encharcamiento por basura",  text: "Las lluvias arrastraron la basura causando mini inundaciones", photo: Image(.flood1), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Acumulación basira en alcantarillas",  text: "En la 5nte han habido encharcamientos por basura", photo: Image(.tendency4), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417))]
        
        self.communityTendencies = [Tendency(description: "Falta de recolección de basura", detailedDescription: "Los vecinos de San Cristobal Tepontla han dejado de tener servicio de recolecci{on de basura", complaint: complaints, image: Image(.tendency1), votes: 215),Tendency(description: "Incendios recurrentes por contaminación", detailedDescription: "En las últimas semanas se han observado diferentes incendios debido a colillas de cigarros y botellas tiradas.", complaint: complaintsF, image: Image(.tendency3), votes: 137), Tendency(description: "Acumulaciones de basura causando encharcamientos", detailedDescription: "En las últimas semanas se han observado diferentes incendios debido a colillas de cigarros, botellas tiradas, etc.", complaint: complaintsI, image: Image(.tendency4), votes: 87)]
        
        self.complaintsG = [Complaint(title: "Basura en parada autobús",  text: "Imposible esperar el autobús", photo: Image(.tendency2), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Basura en parada autobús",  text: "No puedo esperar el autobús bien", photo: Image(.basura3), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417)),Complaint(title: "Basura en esquina del autobús",  text: "Tengo que caminar a otra esquina para poder tomar el autobús", photo: Image(.basura4), category: "low", location: CLLocation(latitude: 37.785834, longitude: -122.406417))]
        
        self.miniCommunityTendencies = [Tendency(description: "La parada de autobús se ha convertido en basurero público", detailedDescription: "La parada de autobús de tu manzana de acuerdo a los vecinos se ha convertido en un basurero público.", complaint: complaintsG, image: Image(.tendency2),votes: 60)]
    }
    
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



