//
//  Main.swift
//  MeetApp
//
//  Created by Александр Лимарев on 20.11.2022.
//

import SwiftUI
import FirebaseAuth

//struct Main: View {
//
//    var body: some View{
//        Text(" Main ")
//    }
//}





struct Main: View {
    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()



    var body: some View {
        ScrollView{
            VStack {
                ForEach(self.profileService.posts, id:\.postId) {
                    (post) in

                    PostCardImage(post: post)
                    PostCard(post: post)
                }
            }

        }.navigationTitle("")
            .navigationBarHidden(true)
            .onAppear{
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)

            }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
 }
