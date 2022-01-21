//
//  HomeViewModel.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
    @Published var products: [Product] = [
    
        Product(type: .Wearable, title: "Series 2", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Wearable, title: "Series 3", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Wearable, title: "Series 4", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Wearable, title: "Series 5", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Phones, title: "iPhones 6", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Phones, title: "iPhones 7", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Phones, title: "iPhones 8", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Phones, title: "iPhones X", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Laptops, title: "MacBook Pro", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Laptops, title: "MacBook Air", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Laptops, title: "MacBook", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Tablets, title: "iPad Pro", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),
        Product(type: .Tablets, title: "iPad Mini", subtitle: "Apple watch series 6", description: "", price: "$355", prductImage: ""),

    ]
    
    @Published var filteredProducts: [Product] = []
    
    init() { filterProducts() }
    
    func filterProducts() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            
                .lazy
                .filter { product in
                    return product.type == self.productType
                    
                }
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}

