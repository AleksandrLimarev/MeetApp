//
//  ProfileService.swift
//  MeetApp
//
//  Created by Александр Лимарев on 22.11.2022.
//

import Foundation

class ProfileService: ObservableObject {
    @Published var posts: [PostModel] = []
    //@Published var
    
    func loadUserPosts(userId: String) {
        PostService.loadUserPosts(userid: userId) {
            (posts) in
            
            self.posts = posts 
        }
    }
}
