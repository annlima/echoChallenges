//

//  ContributionView.swift

//  echo

//

//  Created by iOS Lab on 06/03/24.

//



import SwiftUI
import CoreLocation



struct ContributionView: View {

    @State private var currentTab: Int = options.zero.rawValue

    private let tabList:  [String] = ["Firmar","Agregar"]

    var tendency: Tendency

    var body: some View {

        NavigationStack{

            ScrollView{

                    electionTabBarView(currentTab: $currentTab,tabList: tabList)

                        .frame(maxWidth: .infinity)

                        .frame(alignment: .center)


                    

                    switch currentTab {

                    case options.zero.rawValue:

                        VoteView(tendency: tendency)


                    case options.one.rawValue:

                        Text("view two")

                    default:

                        EmptyView()

                    }
                
                                    

            } //end ScrollView
        } //end navigationStack
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
    }

}



#Preview {

    ContributionView(tendency: Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104))

}





struct VoteView: View {

    var complaints:[Complaint] = [ Complaint(title: "Basura acumulada",
                                             text: "Hay basura acumulada afuera de una casa",
                                             photo: Image(.tendency2),
                                             category: "low",
                                             location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497)),Complaint(title: "Basura acumulada",
                                                                                                                                          text: "Hay basura acumulada afuera de una casa",
                                                                                                                                          photo: Image(.tendency2),
                                                                                                                                          category: "low",
                                                                                                                                          location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497)),Complaint(title: "Basura acumulada",
                                                                                                                                                                                                                                       text: "Hay basura acumulada afuera de una casa",
                                                                                                                                                                                                                                       photo: Image(.tendency2),
                                                                                                                                                                                                                                       category: "low",
                                                                                                                                                                                                                                       location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497)),Complaint(title: "Basura acumulada",
                                                                                                                                                                                                                                                                                                                                    text: "Hay basura acumulada afuera de una casa",
                                                                                                                                                                                                                                                                                                                                    photo: Image(.tendency2),
                                                                                                                                                                                                                                                                                                                                    category: "low",
                                                                                                                                                                                                                                                                                                                                    location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497)),Complaint(title: "Basura acumulada",
                                                                                                                                                                                                                                                                                                                                                                                                                                 text: "Hay basura acumulada afuera de una casa",
                                                                                                                                                                                                                                                                                                                                                                                                                                 photo: Image(.tendency2),
                                                                                                                                                                                                                                                                                                                                                                                                                                 category: "low",
                                                                                                                                                                                                                                                                                                                                                                                                                                 location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497))]
    var tendency: Tendency
    @State var comment: String = ""
    @State var voted:Bool = false
    var body: some View

    {

        VStack{

            Text(tendency.detailedDescription)

                .padding(.horizontal,50)
                .padding(.vertical)
                .multilineTextAlignment(.center)

            HStack{

                VStack{

                    Image(systemName: "chart.bar.fill")

                        .resizable()

                        .frame(width: 60,height: 40)

                        .foregroundColor(.colorPrincipal)

                    Text("\(tendency.votes) denuncias")

                }

                .padding()

                VStack{

                    Image(systemName: "doc.fill")

                        .resizable()

                        .frame(width: 30,height: 40)

                        .foregroundColor(.colorPrincipal)
                        

                    Text("\(tendency.votes) firmas")

                }

                .padding()

            }

            

            ScrollView(.horizontal){

                HStack{

                    ForEach(0 ..< complaints.count, id: \.self) { value in

                        complaintSnippetView(complaints: complaints, index: value)
                        

                            
                    }

                }
                

            }
            
            Text("Agrega un comentario a tu firma")
                .font(.title2)
            TextEditor(text: $comment)
                .frame(width: 300,height: 200)
                .border(Color(.invertedColorPrincipal))

            Button("Firmar")
            {
                voted = true
            }
            .buttonStyle(.plain)
            .frame(width: 150,height: 50)
            .background(Color(.colorPrincipal))
            .font(.title2)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .padding()
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
            
            

        }
        .sheet(isPresented: $voted, content: {
            SignedView()})

    }

}

struct complaintSnippetView: View {
    var complaints:[Complaint]
    var index: Int
    var body: some View {
        ZStack
        {
            Rectangle()
            
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 200)
            
                .foregroundColor(Color(.invertedColorPrincipal))
                .cornerRadius(10)
            VStack
            {
                complaints[index].photo
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .cornerRadius(10)
                    .opacity(0.8)
                Text(complaints[index].text)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .font(.footnote)
                Spacer()
            }
            
            
        }
    }
}
