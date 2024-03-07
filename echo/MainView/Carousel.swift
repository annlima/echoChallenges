//
//  Carousel.swift
//  echo
//
//  Created by iOS Lab on 04/03/24.
//

import SwiftUI

struct news{
var image: Image
var description: String
var url: String
}

struct Carousel: View {
    var news:[news]
    //time for each new
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    
    @State private var selectedImageIndex: Int = 0

    var body: some View {
        ZStack {
            // Step 4: Background Color
            Color.secondary
                .ignoresSafeArea()

            // Step 5: Create TabView for Carousel
            TabView(selection: $selectedImageIndex) {
                // Step 6: Iterate Through Images
                ForEach(0..<news.count, id: \.self) { index in
                    Button(action:{
                        if let realurl = URL(string: news[index].url)
                        {
                            UIApplication.shared.open(realurl)
                        }
                        
                    })
                    {
                        ZStack() {
                            // Step 7: Display Image
                            news[index].image
                                .resizable()
                                .tag(index)
                                .frame(width: .infinity, height: 300)
                                .opacity(0.4)
                            VStack{
                                Spacer()
                                HStack{
                                    Text(news[index].description)
                                        .padding(.bottom,40)
                                        .padding(.horizontal)
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                
                            }
                        }
                    }
                    
                }
            }
            .frame(height: 300) // Step 10: Set Carousel Height
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Step 11: Customize TabView Style
            //.ignoresSafeArea()

            // Step 12: Navigation Dots
            HStack {
                ForEach(0..<news.count, id: \.self) { index in
                    // Step 13: Create Navigation Dots
                    Capsule()
                        .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 20, height: 6)
                        .onTapGesture {
                            // Step 14: Handle Navigation Dot Taps
                            selectedImageIndex = index
                        }
                }
                .offset(y: 130) // Step 15: Adjust Dots Position
            }
        }
        .frame(width: .infinity,height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .onReceive(timer) { _ in
            // Step 16: Auto-Scrolling Logic
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % news.count
            }
        }
    
    }
    
}

