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
                Image("characters_home")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
                    
                VStack {
                    Spacer().frame(height: geometry.size.height * 0.25)
                    Image("tans_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.4)
                    Spacer().frame(height: geometry.size.height * 0.06)
                    HomeButton(title: "HomeButtonSelectGame", color: Color("blueTan"), largura: geometry.size.width * 0.3, altura: geometry.size.height * 0.12, action: {
                        self.hapticFeedback()
                        isShowingMenu.toggle()
                    })
                    Spacer()

                }
            }
            .background(Color("backgroundColor"))
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
