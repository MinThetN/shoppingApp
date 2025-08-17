//
//  AuthView.swift
//  shoppingApp
//
//  Created by Min Thet Naung on 17/08/2025.
//

import SwiftUI

enum AuthStyle: String {
    case signIn = "Sign In"
    case signUp = "Sign Up"
}

struct AuthView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showForgotPassword = ""
    @State private var selectedAuthStyle: AuthStyle = .signUp
    
    private var isSignUp: Bool {
        return selectedAuthStyle == .signUp
    }
    
    var body: some View {
        ZStack {
            // Background
            ZStack {
                Color.black
                    .opacity(0.5)
                    .zIndex(1)
                
                // Background image
                Image("healthy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .ignoresSafeArea()
            
            VStack {
                // app name
                VStack(spacing: 15) {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .foregroundStyle(.white)
                        .padding(.top, 50)
                    
                    Text("ShoppingList")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text(isSignUp ? "Create Your Account" : "Welcome Back")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundStyle(Color.white.opacity(0.9))
                }
                
                // Custom segmented buttons
                HStack(spacing: 10) {
                    // sign in
                    AuthButton(title: "Sign In", isSelected: selectedAuthStyle == .signIn) {
                        withAnimation(.easeOut) {
                            selectedAuthStyle = .signIn
                        }
                    }
                    
                    // sing up
                    AuthButton(title: "Sign Up", isSelected: selectedAuthStyle == .signUp) {
                        withAnimation(.easeOut) {
                            selectedAuthStyle = .signUp
                        }
                    }
                }
                .padding(1)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                )
                
            }
            .padding()
            
        }
    }
}

#Preview {
    AuthView()
}
