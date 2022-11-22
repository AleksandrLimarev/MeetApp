//
//  Profile.swift
//  MeetApp
//
//  Created by Александр Лимарев on 20.11.2022.
//

import SwiftUI

struct Profile: View {
    
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    
    
    var body: some View {
        
        ScrollView{
        VStack{
        
            ProfileHeader(user: self.session.session)
            
            Button(action: {}){
                    Text("Edit Profile").font(.title).modifier(ButtonModifiers())
                    
            }.padding(.horizontal)
            
            Picker("", selection: $selection){
                Image(systemName: "circle.grid.2x2.fill").tag(0)
                Image(systemName: "person.circle").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            
            
            
        }
        
        
    }
        .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {}){
                Image(systemName: "person.fill")
            }, trailing: Button(action: {}){
                Image(systemName: "arrow.right.circle.fill")
            })
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}

}
