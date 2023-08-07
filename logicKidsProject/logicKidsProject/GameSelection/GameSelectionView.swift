//
//  GameSelectionView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct GameSelectionView: View {
    @State private var isShowingGame = false
    var dismissSelection: (() -> Void)
    
    let listOfGames : [String] = [
        "game1",
        "gameoff",
        "gameoff",
        "gameoff",
        "gameoff",
        "gameoff"
    ]
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack{
                    Spacer()
                    HStack(){
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .onTapGesture{
                                dismissSelection()
                            }
                        Spacer()
                        Text("Select a game")
                            .font(Font.titleLargeBold)
                        Spacer()
                    }
                    .padding(.horizontal,64)
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                Spacer(minLength: 64)
                                ForEach(0..<(listOfGames.count)) { i in
                                    Image(listOfGames[i])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.6)
                                        .onTapGesture {
                                            if (i == 0 ){
                                                isShowingGame.toggle()
                                            }
                                        }
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(.all)
        .fullScreenCover(isPresented: $isShowingGame) {
            TangramGameView(dismissAction: {isShowingGame = false})
        }
        
    }
}

struct GameSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectionView(dismissSelection: {true})
    }
}

//struct GameSelectionView: View {
//    @State private var isShowingGame = false
//    var body: some View {
//        GeometryReader{ geometry in
//            VStack{
//                Spacer()
//                ScrollView(.horizontal){
//                    HStack(){
//                        Button(action: {
//                            isShowingGame.toggle()
//                        }) {
//                            Image("game")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: geometry.size.width * 0.4)
//                                .padding(CGFloat(32))
//
//                        }
//                    }
//                }
//                Spacer()
//            }
//        }
//        .fullScreenCover(isPresented: $isShowingGame) {
//            TangramInstructionView(dismissAction: {isShowingGame = false})
//        }
//    }
//}
//
//struct GameSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSelectionView()
//    }
//}


//struct GameSelectionView: View {
//    @State private var isShowingGame = false
//    var body: some View {
//        NavigationView(){
//            VStack{
//                ScrollView(.vertical){
//                    HStack{
//                        Button(action: {
//                            isShowingGame.toggle()
//                        }) {
//
//                            Image("game_one")
//                                .resizable()
//                                .frame(width: 200,height: 200)
//                        }
//                        Spacer()
//                        Image("game_two")
//                            .resizable()
//                            .frame(width: 200,height: 200)
//                        Spacer()
//                        Image("game-three")
//                            .resizable()
//                            .frame(width: 200,height: 200)
//                    }
//                    HStack{
//                        Image("no_game")
//                            .resizable()
//                            .frame(width: 180,height: 180)
//                        Spacer()
//                        Image("no_game")
//                            .resizable()
//                            .frame(width: 180,height: 180)
//                        Spacer()
//                        Image("no_game")
//                            .resizable()
//                            .frame(width: 180,height: 180)
//                    }
//                }
//
//                    NavigationLink{AchievementsView()
//
//                    } label: {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                                .frame(width: 500, height: 50)
//                                .foregroundColor(Color(hue: 0.545, saturation: 0.503, brightness: 0.923))
//                            Text("Veja suas conquistas")
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                        }
//                    }
//
//
//
//            }
//        }
//        .fullScreenCover(isPresented: $isShowingGame) {
//            TangramInstructionView(dismissAction: {isShowingGame = false})
//        }
//    }
//}
