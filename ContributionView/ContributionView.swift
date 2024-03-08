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


            ScrollView{

                VoteView(tendency: tendency)
                
                                    

            } //end ScrollView
            .navigationBarTitleDisplayMode(.inline)
    }

}



#Preview {

    ContributionView(tendency: Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", complaint: [ Complaint(title: "Basura acumulada",
                                                                                                                                                                                                                                                                                                               text: "Hay basura acumulada afuera de una casa",
                                                                                                                                                                                                                                                                                                               photo: Image(.tendency2),
                                                                                                                                                                                                                                                                                                               category: "low",
                                                                                                                                                                                                                                                                                                               location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497)), Complaint(title: "Basura acumulada",
                                                                                                                                                                                                                                                                                                                                                                                                             text: "Hay basura acumulada afuera de una casa",
                                                                                                                                                                                                                                                                                                                                                                                                             photo: Image(.tendency2),
                                                                                                                                                                                                                                                                                                                                                                                                             category: "low",
                                                                                                                                                                                                                                                                                                                                                                                                             location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497))],image: Image(.tendency1), votes: 104))

}





struct VoteView: View {

    var tendency: Tendency
    @State var comment: String = ""
    @State var voted:Bool = false
    @State var photo:Bool = false
    private let tabList:  [String] = ["Comentario","Foto"]
    @State private var currentTab: Int = options.zero.rawValue
    @State private var image: UIImage?
    var body: some View

    {

        VStack{

            Text("Tendencia en tu comunidad:")
                .font(.system(size: 30, weight: .bold))
                .padding()
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

            

            HStack{
                Spacer()
                    ScrollView(.horizontal){
                        
                        HStack {
                            Spacer()
                            ForEach(0 ..< tendency.complaint.count, id: \.self) { value in

                                complaintSnippetView(complaints: tendency.complaint, index: value)   
                                    .padding(.horizontal,10)
                            }
                            Spacer()
                        }
         
                    }
                Spacer()

            }
            
            electionTabBarView(currentTab: $currentTab,tabList: tabList)

                .frame(maxWidth: .infinity)

                .frame(alignment: .center)
                .padding()
            
            switch currentTab {

            case options.zero.rawValue:

                TextEditor(text: $comment)
                    .frame(width: 300,height: 200)
                    .border(Color(.invertedColorPrincipal))
                    .padding()



            case options.one.rawValue:
                CameraView(image: $image)

                
            default:

                EmptyView()

            }
            
            Button("Firmar")
            {
                voted = true
                //Clear TextEditor
                comment = ""
            }
            .buttonStyle(.plain)
            .frame(width: 200,height: 50)
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
                    .multilineTextAlignment(.center)
                Spacer()
            }
            
            
        }
    }
}
