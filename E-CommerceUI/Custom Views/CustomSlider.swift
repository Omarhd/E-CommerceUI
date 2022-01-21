//
//  CustomSlider.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

@ViewBuilder
func ProductTypeView(type: ProductType, color: HomeViewModel, aniamtion: Namespace.ID) -> some View {
    
    Button {
        withAnimation {
            color.productType = type
        }
    } label: {
        Text(type.rawValue)
            .font(Font.custom("futura", size: 16))
            .fontWeight(.semibold)
            .foregroundColor(color.productType == type ? Color("Purple") : Color.gray)
            .padding(.bottom, 10)
        
            .overlay(
            
                ZStack {
                    if color.productType == type {
                        Capsule()
                            .fill(Color("Purple"))
                            .matchedGeometryEffect(id: "PRODUCTTAB", in: aniamtion)
                            .frame(height: 2)
                    } else {
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 2)
                    }
                }
                    .padding(.horizontal, -4)
                , alignment: .bottom
            )
    }
}
