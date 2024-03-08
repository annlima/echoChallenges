//
//  Post.swift
//  echo
//
//  Created by Azuany Mila Cerón on 07/03/24.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let text: String
    let photo: Image?
}

extension Post {
    static var test: Post {
        
        Post(
            text: "Mi primera vez recolectando basura",
            photo: Image(.leaderBackground)
        )
    }
    
    static var none: Post {
        Post(
            text: "Aún no hay posts",
            photo: Image(systemName: "questionmark.app.dashed")
        )
    }
    
    static var leader1: Post {
        
        Post(
            text: "Los animales son importantes. Hay que cuidarlos y respetarlos.",
            photo: Image(.capibara)
        )
    }
    
    static var leader2: Post {
        
        Post(
            text: "Recolectando rollos de cartón para reciclarlos :D",
            photo: Image(.rollos)
        )
    }
}


