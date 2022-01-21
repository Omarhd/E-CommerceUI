//
//  OnBoarding.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

struct OnBoarding: View {
    
    @State private var showingLoginView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Be \nBeauty")
                .font(Font.custom("futura", size: 60))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image("OnBoarding")
                .resizable()
                .frame(width: .infinity, height: 400, alignment: .center)
                .aspectRatio(contentMode: .fit)
            
            Button {
                withAnimation {
                    showingLoginView = true
                }
            } label: {
                Text("Get Started")
                    .font(Font.custom("futura", size: 20))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal, 30)
            .offset(y: 20)
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Purple"))
        
        .overlay(
        
            Group {
                if showingLoginView {
                    LoginView()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
