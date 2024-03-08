//
//  Profile.swift
//  echo
//
//  Created by Azuany Mila Cerón on 06/03/24.
//

import SwiftUI


struct Profile {
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
    let badges: [Int]
}

extension Profile {
    
    static var andy: Profile {
        Profile(
            name: "Andrea Lima",
            headline: "Estudiante de Ing. Sistemas Computacionales @ UDLAP",
            about: "Me gusta comer Sushi y ayudar a mi comunidad a solucionar problemas medio ambientales",
            backgroundPhoto: Image(.userBackground),
            profilePhoto: Image(.userPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 20,
            ig: "andy.lima10",
            tw: "andy-lima",
            fb: "andylima",
            
            posts: [
                Post.test,
                Post.test
            ],
            complaints: [
                Complaint.test3
            ],
            reunions: [
                Reunion.none
            ],
            experiences: [
                Experience.none
            ],
            badges: [2, 3, 4]
            
        )
    }
    
    static var dicka: Profile {
        Profile(
            name: "Dicka Lezama",
            headline: "Estudiante de Ing. Sistemas Computacionales @ UDLAP",
            about: "Me gusta comer Sushi y ayudar a mi comunidad a solucionar problemas medio ambientales",
            backgroundPhoto: Image(.dickaBg),
            profilePhoto: Image(.dickaPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 20,
            ig: "dicklz",
            tw: "dickalz01",
            fb: "dicka-lz",
            
            posts: [
                Post.test,
                Post.test
            ],
            complaints: [
                Complaint.test3
            ],
            reunions: [
                Reunion.none
            ],
            experiences: [
                Experience.none
            ],
            badges: [3, 4]
            
        )
    }
    
    static var azu: Profile {
        Profile(
            name: "Azuany Mila",
            headline: "Estudiante de Ing. Sistemas Computacionales @ UDLAP",
            about: "Me gusta ver One Piece y el desarrollo de apps",
            backgroundPhoto: Image(.azuBg),
            profilePhoto: Image(.azuPhoto),
            isVerified: true,
            location: "Puebla, Puebla, México",
            age: 19,
            ig: "azu.any",
            tw: "azuany",
            fb: "azuany.mila",
            
            posts: [
                Post.test,
                Post.test
            ],
            complaints: [
                Complaint.test3
            ],
            reunions: [
                Reunion.none
            ],
            experiences: [
                Experience.none
            ],
            badges: [4]
            
        )
    }
    
    static var test: Profile {
        Profile(
            name: "Catherine",
            headline: "My name is Catherine. I like dancing in the rain and travelling all around the world.",
            about: "Me gusta ser yo xD",
            backgroundPhoto: Image(.leaderBackground),
            profilePhoto: Image(.userPhoto),
            isVerified: true,
            location: "San Andrés Cholula, Puebla, México",
            age: 21,
            ig: "cath",
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
                Experience.none
            ],
            badges: [0, 1, 2, 3, 4]
            
        )
    }
}
