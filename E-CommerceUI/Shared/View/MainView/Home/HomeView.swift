//
//  HomeView.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var homeData: HomeViewModel = HomeViewModel()
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                Capsule()
                    .strokeBorder(Color.gray, lineWidth: 0.6)
                )
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal)
                
                Text("Order Online \nCollections")
                    .font(Font.custom("futura", size: 28))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(ProductType.allCases, id: \.self) { type in
                            ProductTypeView(type: type, color: homeData, aniamtion: animation)
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25) {
                        ForEach (homeData.filteredProducts) { product in
                            Production(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.vertical)
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("OffWhite"))
        .onChange(of: homeData.filteredProducts) { newValue in
            homeData.filterProducts()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
