//
//  CustomTextFields.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

@ViewBuilder
func CustomTextField(icon: String,
                     title: String,
                     hint: String,
                     value: Binding<String>,
                     showPassword: Binding<Bool>) -> some View {
    
    VStack(alignment: .leading, spacing: 12) {
        Label {
            Text(title)
                .font(Font.custom("futura", size: 14))
        } icon: {
            Image(systemName: icon)
        }
        .foregroundColor(Color.black.opacity(0.6))
        
        if title.contains("Password") && !showPassword.wrappedValue {
            SecureField(hint, text: value)
                .padding(.top, 2)
            
        } else {
            TextField(hint, text: value)
                .padding(.top, 2)
        }
        
        Divider()
            .background(Color.black.opacity(0.4))
    }
    
    .overlay(
        
        
        Group {
            if title.contains("Password") {
                Button(action: {
                    showPassword.wrappedValue.toggle()
                }, label: {
                    Text(showPassword.wrappedValue ? "Hide" : "Show")
                        .font(Font.custom("futura", size: 12).bold())
                        .foregroundColor(Color("Purple"))
                })
                    .offset(y: 8)
            }
        }
        , alignment: .trailing
    )
}
