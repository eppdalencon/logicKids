//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI


// da pra criar um enm para o type se precisar
struct TangramIntroductionView: View {
//    init() {
//
//    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .foregroundColor(.green)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            //.edgesIgnoringSafeArea(.all)
        }
    }
}

struct TangramIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        TangramGameView()
    }
}
