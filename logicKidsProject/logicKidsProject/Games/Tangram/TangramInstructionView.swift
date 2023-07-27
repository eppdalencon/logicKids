//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct TangramInstructionView: View {
    
    var body: some View {

        NavigationView {
            GeometryReader { geometry in
                HStack (spacing:0){
                    VStack {
                        Text("Tangram")
                            .font(.largeTitle)
                        Spacer()
                        Image("placeholder")
                            .resizable()
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.7)
                    }
                    .frame(width: geometry.size.width * 0.3)
                    .padding()
                    
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                        Spacer()
                        NavigationLink(destination: TangramGameView()) {
                            Text("Iniciar")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        
                    }
                    .frame(width: geometry.size.width * 0.7)
                    .padding()
                    
                }
                
            }
            
        }
        .padding()
    }
}


struct TangramInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        TangramGameView()
    }
}
