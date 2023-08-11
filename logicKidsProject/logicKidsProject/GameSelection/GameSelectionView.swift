//
//  GameSelectionView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct GameSelectionView: View {
    @State private var isShowingGame1 = false
    @State private var isShowingGame2 = false
    @State private var isShowingGame3 = false
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
                        Text(String(localized: "SelectGameTitle"))
                            .font(Font.titleLargeBold)
                        Spacer()
                    }
                    .padding(.horizontal,32)
                    Spacer()
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                Spacer(minLength: 64)
                                
                                Image(listOfGames[0])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.6)
                                    .onTapGesture {
                                        isShowingGame1.toggle()
                                    }
                                
                                Image(listOfGames[0])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.6)
                                    .onTapGesture {
                                        isShowingGame2.toggle()
                                    }
                                
                                Image(listOfGames[0])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.6)
                                    .onTapGesture {
                                        isShowingGame3.toggle()
                                    }
                                
                                Image(listOfGames[1])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.6)
                                    .onTapGesture {
                                        
                                    }
                                
                                Image(listOfGames[1])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.6)
                                    .onTapGesture {
                                      
                                    }
                            }
                        }
                    }
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea(.all)
        .background(Color("backgroundColor"))
        .fullScreenCover(isPresented: $isShowingGame1) {
            TangramGameView(dismissAction: {isShowingGame1 = false})
        }
        .fullScreenCover(isPresented: $isShowingGame2) {
            TrueFalseGameView(dismissAction: {isShowingGame2 = false})
        }
        
        .fullScreenCover(isPresented: $isShowingGame3) {
            BiggerSmallerGameView(dismissAction: {isShowingGame3 = false})
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
