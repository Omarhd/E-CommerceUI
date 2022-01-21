//
//  Product.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var prductImage: String = ""
    var quantity: Int = 1
}
