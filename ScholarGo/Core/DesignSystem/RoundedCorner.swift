//
//  RoundedCorner.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//


import SwiftUI

struct RoundedCorner: Shape {
    
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        let tr = min(min(self.topRight, height/2), width/2)
        let tl = min(min(self.topLeft, height/2), width/2)
        let bl = min(min(self.bottomLeft, height/2), width/2)
        let br = min(min(self.bottomRight, height/2), width/2)
        
        path.move(to: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width - tr, y: 0))
        path.addArc(
            center: CGPoint(x: width - tr, y: tr),
            radius: tr,
            startAngle: .degrees(-90),
            endAngle: .degrees(0),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(x: width, y: height - br))
        path.addArc(
            center: CGPoint(x: width - br, y: height - br),
            radius: br,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(x: bl, y: height))
        path.addArc(
            center: CGPoint(x: bl, y: height - bl),
            radius: bl,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(
            center: CGPoint(x: tl, y: tl),
            radius: tl,
            startAngle: .degrees(180),
            endAngle: .degrees(270),
            clockwise: false
        )
        
        return path
    }
}