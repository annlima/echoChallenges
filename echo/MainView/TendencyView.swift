//
//  TendencyView.swift
//  echo
//
//  Created by iOS Lab on 06/03/24.
//

import SwiftUI
import CoreLocation

struct Tendency: Hashable, Equatable {
    var description: String
    var detailedDescription: String
    var complaint: [Complaint]
    var image: Image
    var votes: Int

    // Hash function implementation
    func hash(into hasher: inout Hasher) {
        hasher.combine(description)
        hasher.combine(votes)
        // No es posible combinar directamente la imagen, podrías transformarla en algún formato
        // único que pueda ser hasheado, como su nombre o un identificador único.
    }

    // Equatable function implementation
    static func ==(lhs: Tendency, rhs: Tendency) -> Bool {
        return lhs.description == rhs.description &&
               lhs.detailedDescription == rhs.detailedDescription &&
               lhs.complaint == rhs.complaint &&
               lhs.image == rhs.image &&
               lhs.votes == rhs.votes
    }
}

struct TendencyView: View {
    var tendency: Tendency
    var body: some View {
        
            ZStack{
                Rectangle()
                    .foregroundStyle(.invertedColorPrincipal)
                    .frame(width: 350,height: 180)
                    .cornerRadius(10)
                    
                
                HStack{
                    tendency.image
                        .resizable()
                        .frame(width: 110,height: 110)
                        .padding(.leading, 20)
                    VStack
                    {
                        Text(tendency.description)
                            .frame(width:200,height: 80)
                        HStack (){
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width:20,height:20)
                                .opacity(0.6)
                            Text("\(tendency.votes) personas han firmado")
                                .font(.custom("SanFrancisco", size: 12))
                                .opacity(0.6)
                               
                            Spacer()
                            
                            
                        }
                        .frame(width:200,height: 40)
                        
                                    
                    }
                    .padding(.trailing)
                    
                }
            }
            .clipped()
        
    }
}

#Preview {
    
    TendencyView(tendency:Tendency(description: "La parada de autobús se ha convertido en basurero público", detailedDescription: "La parada de autobúas de tu manzana de acuerdo a los vecinos se ha convertido en un basurero público.", complaint: [ Complaint(title: "Basura acumulada",
                                                                                                                                                                                                                                                                  text: "Hay basura acumulada afuera de una casa",
                                                                                                                                                                                                                                                                  photo: Image(.tendency2),
                                                                                                                                                                                                                                                                  category: "low",
                                                                                                                                                                                                                                                                  location: CLLocation(latitude: 19.052079853258167, longitude: -98.28510777831497))], image: Image(.tendency2),votes: 60))
}
