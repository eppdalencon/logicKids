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
                VStack{
                    Spacer()
                    HStack{
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .onTapGesture{
                                dismissAchievements()
                            }
                        Spacer()
                        Text("My Achievements")
                            .font(Font.titleLargeBold)
                        Spacer()
                    }
                    .padding(.horizontal, 32)
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                Spacer(minLength: 32)
                                ForEach(0..<(listOfAchievements.count-1)){ i in
                                    Image(listOfAchievements[i])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.6)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                //.padding(.leading,64)
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(dismissAchievements: {true})
    }
}
