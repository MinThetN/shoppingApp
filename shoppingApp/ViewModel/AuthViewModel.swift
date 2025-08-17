//
//  AuthViewModel.swift
//  shoppingApp
//
//  Created by Min Thet Naung on 17/08/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel: ObservableObject {
    static let shared = AuthViewModel()
    
    @Published var user: User?
    
    init() {
        self.user = Auth.auth().currentUser
    }
    
    // Sign in
    func signIn(email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        
        self.user = result.user
    }
    
    // Sign up
    func signUp(email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        let user = result.user
        
        // save user data to firestore database
        // -> user collection -> user.uid ( user id = 123)
        if let userEmail = user.email {
            try await Firestore.firestore().collection("users").document(user.uid).setData([
                "email": userEmail,
                "joinDate": Timestamp(date: Date.now)
            ])
        }
        
        // Updating the user
        self.user = user
        
    }
    
    // Reset Password
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    // Log out
    func logout() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
