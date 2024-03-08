//
//  Leader.swift
//  echo
//
//  Created by Azuany Mila Cerón on 07/03/24.
//

import SwiftUI


// Leader definition
struct LeaderProfile {
    let name: String
    let headline: String
    let about: String
    let backgroundPhoto: Image
    let profilePhoto: Image
    let isVerified: Bool
    let location: String
    let age: Int
    let ig: String
    let tw: String
    let fb: String
    let posts: [Post]?
    let complaints: [Complaint]?
    let reunions: [Reunion]?
    let experiences: [Experience]?
    let projects: [Project]?
    let badges: [Int]
}

extension LeaderProfile {
    static var test: LeaderProfile {
        LeaderProfile(
            name: "Juan Pérez",
            headline: "Estudiante de Ing. Sistemas Computacionales @ UDLAP",
            about: "Me gusta comer Sushi y ayudar a mi comunidad a solucionar problemas medio ambientales",
            backgroundPhoto: Image(.leaderBackground),
            profilePhoto: Image(.leaderPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 21,
            ig: "juan.perez01",
            tw: "juan.pp",
            fb: "juan.p1",
        
            posts: [
                Post.test,
                Post.test
            ],
            complaints: [
                Complaint.test,
                Complaint.test2
            ],
            reunions: [
                Reunion.test,
                Reunion.test
            ],
            experiences: [
                Experience.leader,
                Experience.service
            ],
            projects: [
                Project.test,
                Project.app
            ],
            badges: [0, 1, 2, 3, 4]
            
        )
    }
    
    
    static var fer: LeaderProfile {
        LeaderProfile(
            name: "Fer Ahuatzin",
            headline: "Estudiante de Ing. Sistemas Computacionales y de Ecología",
            about: "Me gusta comer Sushi y ayudar a mi comunidad a solucionar problemas medio ambientales",
            backgroundPhoto: Image(.leaderBackground),
            profilePhoto: Image(.leaderPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 21,
            ig: "fer.ahuatzin",
            tw: "fer-ahuatzin",
            fb: "fer.ahuatzin01",
        
            posts: [
                Post.leader1,
                Post.leader2
            ],
            complaints: [
                Complaint.test,
                Complaint.test2
            ],
            reunions: [
                Reunion.test,
                Reunion.test2
            ],
            experiences: [
                Experience.leader,
                Experience.service
            ],
            projects: [
                Project.test,
                Project.app
            ],
            badges: [0, 1, 2, 3, 4]
            
        )
    }
    
}
