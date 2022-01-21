//
//  CustomCorners.swift
//  E-CommerceUI
//
//  Created by Omar Abdulrahman on 1/21/22.
//

import SwiftUI

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        
        return Path(path.cgPath)
    }
}
