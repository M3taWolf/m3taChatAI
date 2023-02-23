//
//  RoundedShape.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 11.02.23.
//

import Foundation
import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,  cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
