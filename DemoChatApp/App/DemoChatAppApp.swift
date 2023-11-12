//
//  DemoChatAppApp.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct DemoChatAppApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}
