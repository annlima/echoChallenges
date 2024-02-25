//
//  ChallengesView.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

class ChallengesViewModel: ObservableObject {
    @Published var challenges: [PChallenge]
    
    init(challenges: [PChallenge]) {
        self.challenges = challenges
    }
}

struct ChallengesView: View {
    @ObservedObject var viewModel: ChallengesViewModel
    
    var body: some View {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Spacer(minLength: 0)
                        HStack{
                            Spacer(minLength: 0)
                        }
                        ForEach(viewModel.challenges.indices, id: \.self) { index in
                            ChallengeRow(challenge: viewModel.challenges[index])
                        }
                        Spacer(minLength: 0)
                    }
                    .frame(minHeight: geometry.size.height)
                }
            }
        }
}

struct ChallengeRow: View {
    var challenge: PChallenge
    
    var body: some View {
        NavigationLink(destination: ChallengeInfoView(challenge: challenge)) {
            HStack {
                    Image(systemName: "leaf.fill")
                    Text(challenge.name)
                        .fontWeight(.semibold)
            }
            .padding()
            .background(Color.colorPrincipal)
            .cornerRadius(9)
            .padding(.top)
            .foregroundColor(Color.white)
        }
    }
}


struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        // Create example challenges
        let exampleChallenges = [
            DailyChallenge(id: "001", name: "Challenge One", description: "This is the first challenge", startDate: Date(), points: 10),
            DailyChallenge(id: "002", name: "Challenge Two", description: "This is the second challenge", startDate: Date(), points: 20),
            WeeklyChallenge(id: "003", name: "Weekly Challenge One", description: "This is the first weekly challenge", startDate: Date(), points: 20),
            MonthlyChallenge(id: "004", name: "Monthly Challenge One", description: "This is the first monthly challenge", startDate: Date(), points: 20)
        ]

        // Initialize the view model with the example challenges
        let viewModel = ChallengesViewModel(challenges: exampleChallenges)

        // Return the ChallengesView for previewing
        ChallengesView(viewModel: viewModel)
    }
}

