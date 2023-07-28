//
//  GameSelectionView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct GameSelectionView: View {
    var body: some View {
        VStack{
            ScrollView(.vertical){
                HStack{
                    Image("game_one")
                        .resizable()
                        .frame(width: 200,height: 200)
                    Spacer()
                    Image("game_two")
                        .resizable()
                        .frame(width: 200,height: 200)
                    Spacer()
                    Image("game-three")
                        .resizable()
                        .frame(width: 200,height: 200)
                }
                HStack{
                    Image("no_game")
                        .resizable()
                        .frame(width: 180,height: 180)
                    Spacer()
                    Image("no_game")
                        .resizable()
                        .frame(width: 180,height: 180)
                    Spacer()
                    Image("no_game")
                        .resizable()
                        .frame(width: 180,height: 180)
                }
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(width: 500, height: 50)
                    .foregroundColor(Color(hue: 0.545, saturation: 0.503, brightness: 0.923))
                Text("Veja suas conquistas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
        }
    }
}

struct GameSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectionView()
    }
}
