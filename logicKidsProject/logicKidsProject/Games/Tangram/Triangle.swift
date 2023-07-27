//
//  Triangle.swift
//  logicKidsProject
//
//  Created by Gustavo Diefenbach on 25/07/23.
//

import SwiftUI

struct TriangleView: Shape {
    let width: CGFloat
    let height: CGFloat

    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))

        return path
    }
}
