//
//  MainView.swift
//  shoppingApp
//
//  Created by Min Thet Naung on 17/08/2025.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var authViewModel = AuthViewModel.shared
    
    var body: some View {
        VStack {
            if let userEmail = authViewModel.user?.email {
                Text("Welcome, \(userEmail)")
            }
            
            // Log out
            Button {
                authViewModel.logout()
            } label: {
                Text("Log out")
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(15)
            
        }
    }
}

#Preview {
    MainView()
}
