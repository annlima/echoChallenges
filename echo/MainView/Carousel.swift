//
//  Carousel.swift
//  echo
//
//  Created by iOS Lab on 04/03/24.
//

import SwiftUI

struct Carousel: View {
    var imageNames: [String]
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
                ForEach(0..<imageNames.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        // Step 7: Display Image
                        Image("\(imageNames[index])")
                            .resizable()
                            .tag(index)
                            .frame(width: 350, height: 200)
                    }
                }
            }
            .frame(height: 300) // Step 10: Set Carousel Height
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Step 11: Customize TabView Style
            //.ignoresSafeArea()

            // Step 12: Navigation Dots
            HStack {
                ForEach(0..<imageNames.count, id: \.self) { index in
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
                selectedImageIndex = (selectedImageIndex + 1) % imageNames.count
            }
        }
    
    }
    
}

#Preview {
    Carousel(imageNames: ["circle.fill","circle.fill","circle.fill","circle.fill"])
}
