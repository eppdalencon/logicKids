//
//  AchievementsView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        HStack{
            VStack{
                Spacer()
                Text("Conquistas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Image("happy_cell")
                    .resizable()
                    .frame(width: 300,height: 200)
                Spacer()
            }
            
            Spacer()
            
            ScrollView(.vertical){
                Spacer()
                
                Image("level_one")
                    .resizable()
                    .frame(width: 300,height: 100)
                Spacer()
                
                Image("level_two")
                    .resizable()
                    .frame(width: 300,height: 100)
                Spacer()
                
                Image("level_three")
                    .resizable()
                    .frame(width: 300,height: 100)
                Spacer()
                
                Image("level_four")
                    .resizable()
                    .frame(width: 300,height: 100)
                Spacer()
            }
            
            Spacer()
            
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}
