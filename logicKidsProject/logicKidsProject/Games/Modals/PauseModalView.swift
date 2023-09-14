//
//  PauseModalView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct PauseModalView: View {
    @Binding var show: Bool
    var shuffleGame: (() -> Void)
    var dismissGame: (() -> Void)
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top){
                
                VStack{
                    Spacer().frame(height: geometry.size.height * 0.05)
                    HStack(spacing:geometry.size.width * 0.05){
                        VStack{
                            Button(action: {
                                HapticFeedbackManager.shared.hapticFeedback()
                                dismissGame()
                            }) {
                                Image("QuitButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.1)
                                    .bold()
                            }
                            .foregroundColor(Color("redTan"))
                            Text(String(localized: "QuitButton"))
                                .font(Font.titleMiddleBold)
                            
                        }
                        
                        VStack{
                            Button(action: {
                                HapticFeedbackManager.shared.hapticFeedback()
                                show.toggle()
                                shuffleGame()
                            }) {
                                
                                Image("RestartButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.1)
                                    .bold()
                                    
                            }
                            .foregroundColor(Color("orangeTan"))

                            
                            Text(String(localized: "RestartButton"))
                                .font(Font.titleMiddleBold)
                        }
                        
                        VStack{
                            Button(action: {
                                HapticFeedbackManager.shared.hapticFeedback()
                                show.toggle()
                            }) {
                                Image("ContinueButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.1)
                                    .bold()
                                    
                            }
                            .foregroundColor(Color("greenTan"))
                            Text(String(localized: "ContinueButton"))
                                .font(Font.titleMiddleBold)

                        }
                        
                        
                    }
                    
                    .padding(30)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2.1)
                    .background(Color("backgroundColor"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.teal, lineWidth: 10)
                    )
                    .cornerRadius(20)
                }
                
                
                Text(String(localized: "PausedTitle"))
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.title3)
                    .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.1)
                    .background(Color.teal)
                    .cornerRadius(10)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
        
    }
    
}

struct PauseModalView_Previews: PreviewProvider {
    struct PreviewModel {
        var show: Bool = false
    }
    
    static var previews: some View {
        PauseModalView(show: .constant(false),shuffleGame:{}, dismissGame: {})
    }
}
