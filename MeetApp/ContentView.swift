//
//  ContentView.swift
//  MeetApp
//
//  Created by Александр Лимарев on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func listen(){
        session.listen()
    }
    
   // @State private var mail = ""
   // @State private var password = ""
    
    var body: some View {
   //     VStack{
   //         FormField(value: $mail, icon: "mail", placeholder: "E-mail")
   //         FormField(value: $password, icon: "lock", placeholder: password, isSecure: true)
   //     }
        
        Group{
            if(session.session != nil)
            {
                HomeView()
            }    else     {
                SignInView()
            }
        }.onAppear(perform: listen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
