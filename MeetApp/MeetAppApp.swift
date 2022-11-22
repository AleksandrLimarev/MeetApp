//
//  MeetAppApp.swift
//  MeetApp
//
//  Created by Александр Лимарев on 14.11.2022.
//

import SwiftUI
import Firebase


@main
struct MeetAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SessionStore())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Firebase...")
        FirebaseApp.configure()
        return true
    }
}
