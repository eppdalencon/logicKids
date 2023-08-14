//
//  CustomButtom.swift
//  logicKidsProject
//
//  Created by Fernanda de Castro Teixeira on 01/08/23.
//

import SwiftUI

struct HomeButton: View{
    var title: String
    var color: Color
    var largura : CGFloat
    var altura: CGFloat
    var action: () -> Void
    
    var body: some View{
        Button(action: self.action){
            ZStack{
                color
                Text(self.title)
                    .font(Font.titleNormalBold)
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: largura, height: altura)
        //.background(self.color)
        .cornerRadius(9.0)
        .shadow(color: color.opacity(0.5),radius: 0.0, x: 6, y: 6)
    }
}
