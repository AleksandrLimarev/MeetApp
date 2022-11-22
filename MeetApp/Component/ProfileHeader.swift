//
//  ProfileHeader.swift
//  MeetApp
//
//  Created by Александр Лимарев on 21.11.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    
    var user: User?
    var postsCount: Int
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        
        HStack{
        VStack{
            if user != nil {
                WebImage(url: URL(string: user!.profileIimageUrl)!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100, alignment: .trailing)
                    .padding(.leading)
            } else{
                Color.init(red: 0.9, green: 0.9, blue: 0.9).frame(width: 100, height: 100, alignment: .trailing)
                    .padding(.leading)
            }
            
            Text(user!.username).font(.headline).bold().padding(.leading)
        }
        VStack{
            HStack{
                
                VStack{
                    Text("Posts").font(.footnote)
                    Text("\(postsCount)").font(.title).bold()
                }.padding(.top, 60)
                Spacer()
                VStack{
                    Text("Followers").font(.footnote)
                    Text("\(followers)").font(.title).bold()
                }.padding(.top, 60)
               
                Spacer()
                VStack{
                    Text("\(following)").font(.headline)
                    Text("20").font(.title).bold()
                }.padding(.top, 60)
                Spacer()
            }
        }
        }
    }
}


//struct ProfileHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeader()
//    }
//}
