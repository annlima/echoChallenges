//
//  PostsLeaderView.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI

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

