//
//  AchievementsView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct AchievementsView: View {
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
                        Spacer()
                        Text("Achievements")
                            .font(Font.titleLargeBold)
                        Spacer()
                    }
                    VStack{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0..<(6)){ i in
                                    Image("achivements")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.25)
                                }
                            }
                        }
                    }
                Spacer()
                }
                .padding(.horizontal,32)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}
