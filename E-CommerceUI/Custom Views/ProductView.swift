//
//  ProductView.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

@ViewBuilder
func Production(product: Product) -> some View {
    VStack(spacing: 10) {
        Image(product.prductImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
            .offset(y: -80)
            .padding(.bottom, -80)
        
        Text(product.title)
            .font(Font.custom("futura", size: 18))
            .fontWeight(.semibold)
            .padding(.top)
        
        Text(product.subtitle)
            .font(Font.custom("futura", size: 16))
            .foregroundColor(Color.gray)
        
        Text(product.price)
            .font(Font.custom("futura", size: 16))
            .fontWeight(.bold)
            .foregroundColor(Color("Purple"))
            .padding(.top, 6)
    }
    .padding(.horizontal, 20)
    .padding(.bottom, 22)
    .background(
        Color.white
            .cornerRadius(20)
            .padding(.top, 10)
    )
}
