//
//  LoginView.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var loginObject: LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome, \nBack")
                .font(Font.custom("futura", size: 40).bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                
                    ZStack {
                        LinearGradient(colors: [
                        Color("ColorAppleLight"),
                        Color("ColorPlumDark")
                            .opacity(0.8),
                        Color("Purple")
                        ], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding()
                            .offset(y: -20)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 20, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(30)
                        
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    Text("Login")
                        .font(Font.custom("futura", size: 22).bold())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "mail@mail.com", value: $loginObject.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "1123223-we-23", value: $loginObject.password, showPassword: $loginObject.showPassword)
                        .padding(.top, 10)
                    
                    if loginObject.registerUser {
                        CustomTextField(icon: "lock", title: "Write Password Again", hint: "", value: $loginObject.erEnterPassword, showPassword: $loginObject.showPassword)
                            .padding(.top, 10)
                    }
                    
                    Button {
                        loginObject.forgotPassword()
                    } label: {
                        Text("Forgot Password?")
                            .font(Font.custom("futura", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        if loginObject.registerUser {
                            loginObject.register()
                        } else  {
                            loginObject.login()
                        }
                        
                    } label: {
                        Text(loginObject.registerUser ? "Register" : "Login")
                            .font(Font.custom("futura", size: 18).bold())
                            .padding(.vertical, 14)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.white)
                            .background(Color("Purple"))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.08), radius: 2, x: 2, y: 2)
                    }
                    
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    Button {
                        withAnimation {
                            loginObject.registerUser.toggle()
                        }
                    } label: {
                        Text(loginObject.registerUser ? "Back to Login" : "Create Account")
                            .font(Font.custom("futura", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Purple"))
                    }
                    
                    .padding(.top, 8)
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        
        .onChange(of: loginObject.registerUser) { newValue in
            loginObject.email = ""
            loginObject.password = ""
            loginObject.erEnterPassword = ""
            
            loginObject.showPassword = false
            loginObject.showReEnterdPassword = false
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
