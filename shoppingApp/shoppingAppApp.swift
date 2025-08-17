//
//  shoppingAppApp.swift
//  shoppingApp
//
//  Created by Min Thet Naung on 17/08/2025.
//

import SwiftUI
import Firebase

@main
struct shoppingAppApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    // Init firebase
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.user != nil {
                // Authenticated
                MainView()
            } else {
                //Not authenticate
                AuthView()
            }
            
        }
    }
}
