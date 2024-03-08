//
//  RankView.swift
//  echo
//
//  Created by Andrea Lima Blanca on 08/03/24.
//

import SwiftUI

struct fakeProfile{
    let image: Image
    let username: String
    let ranking: Int
}
struct RankView: View {
    var fakeProfiles:[fakeProfile] = [fakeProfile(image: Image(.jesusPhoto), username: "jesusArmen", ranking: 4), fakeProfile(image: Image(.leaderPhoto), username: "ferAhuatzin", ranking: 5), fakeProfile(image: Image(.maePhoto), username: "maeMzcrt", ranking: 6), fakeProfile(image: Image(.ladisPhoto), username: "ladisMtz", ranking: 7), fakeProfile(image: Image(.geoPhoto), username: "geoCeron", ranking: 8) , fakeProfile(image: Image(.ariPhoto), username: "AriL", ranking: 9)]
    var body: some View {
        ScrollView
        {
            Text("Clasificación de tu comunidad")
                .font(.system(size: 30, weight: .bold))
                .padding(.top,30)
                .padding(.horizontal,30)
                .multilineTextAlignment(.center)
            HStack(alignment: .bottom)
            {
                
                VStack
                {
                    Image("azuPhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(100)
                        .clipped()
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Text("Azu.Mila")
                        //.font(.caption)
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 110)
                        .shadow(color: .gray, radius: 5, x: 0, y:10)
                        .cornerRadius(10)
                        .foregroundColor(.colorPrincipal)
                        .opacity(0.5)
                    
                }
                VStack
                {
                    Image("userPhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(100)
                        .clipped()
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Text("Andy_Lima")
                        //.font(.caption)
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 150)
                        .shadow(color: .gray, radius: 5, x: 0, y:10)
                        .cornerRadius(10)
                        .foregroundColor(.colorPrincipal)
                }
                VStack
                {
                    Image("dickaPhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(100)
                        .clipped()
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Text("D.J.Lezama")
                        //.font(.caption)
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Rectangle()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 70)
                        .shadow(color: .gray, radius: 5, x: 0, y:10)
                        .cornerRadius(10)
                        .foregroundColor(.colorPrincipal)
                        .opacity(0.2)
                }
            }
            .padding()
            ForEach( 0..<fakeProfiles.count, id:\.self){ index in
                HStack
                {
                    fakeProfiles[index].image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(100)
                        .clipped()
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                        .padding()
                    Text(fakeProfiles[index].username)
                        //.font(.title3)
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                    Spacer()
                    Text("#\(fakeProfiles[index].ranking)")
                        //.font(.caption)
                        .shadow(color: .gray, radius: 5, x: 0, y:2)
                        .padding()
                    
                }
                .frame(width: 310,height: 100)
                .background(Color(.invertedColorPrincipal))
                .cornerRadius(10)
            }
        }
        
        
    }
}

#Preview {
    RankView()
}
