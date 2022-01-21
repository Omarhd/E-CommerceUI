//
//  LoginViewModel.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

class LoginViewModel: ObservableObject {
   
    // login properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false

    
    // registartion properties
    @Published var registerUser: Bool = false
    @Published var erEnterPassword: String = ""
    @Published var showReEnterdPassword: Bool = false
    
    // actions
    
    func login() {
        
    }
    
    func register() {
        
    }

    func forgotPassword() {
        
    }
}
