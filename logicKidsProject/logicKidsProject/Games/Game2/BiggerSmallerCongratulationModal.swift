//
//  BiggerSmallerCongratulationModal.swift
//  logicKidsProject
//
//  Created by Gustavo Diefenbach on 10/08/23.
//

import Foundation


import SwiftUI

struct BiggerSmallerCongratulationModal: View {
    var dismissComplete: (() -> Void)
    var dismissGame: (() -> Void)
    var shuffleGame: (() -> Void)
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .top){
                
                VStack{
                    Spacer().frame(height: geometry.size.height * 0.07)
                    VStack {
                        ZStack{
                            VStack{
                                Spacer()
                                HStack (spacing: 30){
                                   
                                    HomeButton(title: "Quit", color: Color.red, largura: geometry.size.width * 0.2, altura: geometry.size.height * 0.1, action: {
                                        dismissGame();dismissComplete()
                                    })

                                    HomeButton(title: "Play Again", color: Color.blue, largura: geometry.size.width * 0.2, altura: geometry.size.height * 0.1, action: {
                                        shuffleGame();dismissComplete()
                                    })
   
                                }
                                .padding(.bottom,geometry.size.height * 0.0)
                            }
                        }
                        
                        
                       
                        
                    }
                    
                    .padding(30)
                    .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 1.3)
                    .background(Color("lightBackground"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.teal, lineWidth: 10)
                    )
                    .cornerRadius(20)
                }
                
                
                Text("Congrats!")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.title2)
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.14)
                    .background(Color.teal)
                    .cornerRadius(10)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
        
    }
}

struct BiggerSmallerCongratulationModal_Previews: PreviewProvider {
    static var previews: some View {
        BiggerSmallerCongratulationModal(dismissComplete: {false},
                                         dismissGame: {false},
                                         shuffleGame: {false})
    }
}
