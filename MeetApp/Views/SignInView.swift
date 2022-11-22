//
//  SignInView.swift
//  MeetApp
//
//  Created by Александр Лимарев on 14.11.2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var error:String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Упс, что-то пошло не так"
    
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty 
        {
            
            return "Заполните пожалуйста все поля"
        }
        
        return nil
        
    }
    
    func clear(){
        self.email = ""
        self.showingAlert = true
        return
    }
    
    
    
    func signIn(){
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        AuthService.signIn( email: email, password: password, onSuccess: {
            (user) in
            self.clear()
        }) {
            (errorMessage) in
            print("Error \(errorMessage)")
           self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
            Image("noun").resizable(capInsets: EdgeInsets(), resizingMode: .stretch).foregroundColor(Color.purple).frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/).font(.system(size: 60, weight: .black, design: .monospaced))
            
            
            VStack(alignment: .leading){
                Text("Добро пожаловать!").font(.system(size: 32, weight: .heavy)).foregroundColor(Color.purple)
                Text("Войдите, чтобы продолжить").font(.system(size: 16, weight: .medium)).foregroundColor(Color.purple)
                
            }

                
                FormField(value: $email, icon: "envelope.fill", placeholder: "E-mail")
                FormField(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
                
            Button(action: signIn){
                    Text("Sign In").font(.title).modifier(ButtonModifiers())
            }.foregroundColor(/*@START_MENU_TOKEN@*/Color.pink/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/14.0/*@END_MENU_TOKEN@*/).alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("OK")))
            }

            
            
                
            HStack{
                Text("New?")
                NavigationLink(destination: SignUpView()) {
                    Text("Create an Account").font(.system(size: 20, weight: .semibold)).foregroundColor(Color.purple)
                }
            }
            
            

            }.padding()
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
