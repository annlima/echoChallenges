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

            ScrollView

            {

                    electionTabBarView(currentTab: $currentTab,tabList: tabList)

                        .frame(maxWidth: .infinity)

                        .frame(alignment: .center)

                        .padding(.top,100)

                        .padding()

                    

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

        

        

        

    }

}



#Preview {

    ContributionView(tendency: Tendency(description: "Esquina 7Nte y 22Pte con exceso de basura", detailedDescription: "En las últimas semanas los vecinos de las calles 7Nte y 22Pte han observado que el camión de la basura no ha pasado generando un exceso de basura.", image: Image(.tendency1), votes: 104))

}





struct VoteView: View {

    var complaints:[Int] = [1,2,3,4,5]

    var tendency: Tendency

    var body: some View

    {

        VStack{

            Text(tendency.detailedDescription)

                .padding(.horizontal,50)

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

                        

                        Rectangle()

                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 200)

                            .foregroundColor(Color(.invertedColorPrincipal))

                            .cornerRadius(10)

                        

                    }

                }

                

            }

            

        }

    }

}
