//
//  PauseModalView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct PauseModalView: View {
    @Binding var show: Bool
    var dismissGame: (() -> Void)
    var body: some View {
        HStack(spacing:30){
            VStack{
                Button(action: {
                    show.toggle()
                }) {
                    
                    Text("Restart")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Image("placeholder")
                    .resizable()
                    
            }
           
           
            
            VStack{
                Button(action: {
                    show.toggle()
                }) {
                    
                    Text("Continue")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Image("placeholder")
                    .resizable()
            }
            
            
            VStack{
                Button(action: {
                   dismissGame()
                }) {
                    
                    Text("Quit")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Image("placeholder")
                    .resizable()
            }
            
        }
        .padding(30)
//        .frame(width: 500, height: 250)
        .background(Color.green)
//        .cornerRadius(20)
        
    }
    
}

struct PauseModalView_Previews: PreviewProvider {
    @Binding var show: Bool
    static var previews: some View {
        //PauseModalView(show:show)
        Text("placeholder")
    }
}
