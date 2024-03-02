//
//  PostsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let text: String
    let photo: Image?
}

struct PostsLeaderView: View {
    
    var post: Post = .test
    
    var body: some View {
        
            
        VStack(alignment: .leading) {
            
            Text(post.text)
                
            
            post.photo?
                .resizable()
                .frame(width: 100, height: 100)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
    }
}

#Preview {
    PostsLeaderView()
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
}
