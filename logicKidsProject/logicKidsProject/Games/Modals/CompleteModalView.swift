//
//  CompleteModalView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct CompleteModalView: View {
    var body: some View {
        VStack{
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack (spacing: 20){
                Button(action: {
                   print("Retry clicado")
                }) {
                    
                    Text("Retry")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("New game clicado")
                }) {
                    
                    Text("New Game")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct CompleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteModalView()
    }
}
