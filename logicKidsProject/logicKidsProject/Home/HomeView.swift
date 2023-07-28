//
//  HomeView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowingMenu = false
    
    var body: some View {
        HStack {
            Text("Nome do Jogo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .rotationEffect(Angle(degrees: Double(-30)))
            Spacer()
            VStack{
                Image("happy_cell")
                    .resizable()
                    .frame(width: 300,height: 200)
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 300, height: 100)
                        .foregroundColor(Color(hue: 0.545, saturation: 0.503, brightness: 0.923))
                    
                    Button(action: {
                        isShowingMenu.toggle()
                    }) {
                        
                        Text("INICIAR")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .padding()
        .fullScreenCover(isPresented: $isShowingMenu) {
            GameSelectionView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
