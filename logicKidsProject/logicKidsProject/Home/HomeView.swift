//
//  HomeView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct HomeView: View {
    @State private var impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isShowingMenu = false
    @State private var isShowingAchievements = false
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Image("background_image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Image("tans_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.45)
                    .position(CGPoint(x: geometry.size.width * 0.55, y: geometry.size.height * 0.35))
                Image("characters_home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.95)
                    
                VStack {
                    HomeButton(title: "HomeButtonAchievements", color: Color("orangeTan"), largura: geometry.size.width * 0.3, altura: geometry.size.height * 0.12, action: {
                        self.hapticFeedback()
                            isShowingAchievements.toggle()
                    })
                    Spacer()
                        .frame(height: geometry.size.height * 0.06)
                    HomeButton(title: "HomeButtonSelectGame", color: Color("blueTan"), largura: geometry.size.width * 0.3, altura: geometry.size.height * 0.12, action: {
                        self.hapticFeedback()
                        isShowingMenu.toggle()
                    })
                }
                .position(CGPoint(x: geometry.size.width * 0.55, y: geometry.size.height * 0.75))
                
            }
            .ignoresSafeArea(.all)
            .fullScreenCover(isPresented: $isShowingMenu) {
                GameSelectionView(dismissSelection: {isShowingMenu = false})
            }
            .fullScreenCover(isPresented: $isShowingAchievements) {
               AchievementsView(dismissAchievements: {isShowingAchievements = false})
            }
        }
    }
    
    private func hapticFeedback() {
        self.impactFeedbackgenerator.prepare()
        self.impactFeedbackgenerator.impactOccurred()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
