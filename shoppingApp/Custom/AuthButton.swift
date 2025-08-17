//
//  AuthButton.swift
//  shoppingApp
//
//  Created by Min Thet Naung on 17/08/2025.
//

import SwiftUI

struct AuthButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(.title3, design: .rounded, weight: isSelected ? .semibold : .regular))
                .foregroundStyle(isSelected ? .white : .black.opacity(0.4))
                .padding(.vertical, 10)
                .padding(.horizontal, isSelected ? 24 : 18)
                .background(
                    isSelected
                    ?
                    AnyView(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue)
                    )
                    :
                        AnyView(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                        )
                )
        }
    }
}

