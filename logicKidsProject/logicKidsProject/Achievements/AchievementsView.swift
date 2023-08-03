//
//  AchievementsView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct AchievementsView: View {
    
    var dismissAchievements: (() -> Void)
    
    let listOfAchievements : [String] = [
        "achivementsoff",
        "achivementsoff",
        "achivementsoff",
        "achivementsoff",
        "achivementsoff",
        "achivementsoff"
    ]
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Image("background_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack{
                    Spacer()
                    HStack{
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .onTapGesture{
                                dismissAchievements()
                            }
                        Spacer()
                        Text("My Achievements")
                            .font(Font.titleLargeBold)
                        Spacer()
                    }
                    .padding(.horizontal, 64)
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                Spacer(minLength: 64)
                                ForEach(0..<(listOfAchievements.count-1)){ i in
                                    Image(listOfAchievements[i])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.25)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                //.padding(.leading,64)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(dismissAchievements: {true})
    }
}
