//
//  TendencyView.swift
//  echo
//
//  Created by iOS Lab on 06/03/24.
//

import SwiftUI

struct Tendency: Hashable{
    var description: String
    var image: Image
    var votes: Int
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(description)
            hasher.combine(votes)
            // No es posible combinar directamente la imagen, podrías transformarla en algún formato
            // único que pueda ser hasheado, como su nombre o un identificador único.
        }
}

struct TendencyView: View {
    var tendency: Tendency
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.secondary)
                .frame(width: 350,height: 180)
                .opacity(0.3)
                .cornerRadius(10)
            
            HStack{
                tendency.image
                    .resizable()
                    .frame(width: 110,height: 110)
                    .padding(.leading, 20)
                VStack
                {
                    Text(tendency.description)
                        .frame(width:200,height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width:20,height:20)
                            .opacity(0.6)
                        Text("\(tendency.votes) personas han votado")
                            .font(.custom("SanFrancisco", size: 12))
                            .opacity(0.6)
                           
                        
                        Button("Contribuir")
                        {
                            
                        }
                        .frame(width: 100,height: 30)
                        .foregroundStyle(.white)
                        .background(Color("ColorPrincipal"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        
                        
                        
                    }
                    .frame(width:200,height: 50)
                                
                }
                .padding(.trailing)
                
            }
        }
        .clipped()
    }
}

#Preview {
    
    TendencyView(tendency:Tendency(description: "La parada de autobús se ha convertido en basurero público", image: Image(.tendency2), votes: 60))
}
