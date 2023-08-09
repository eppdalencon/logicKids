//
//  BiggerSmallerGameView.swift
//  logicKidsProject
//
//  Created by Fernanda de Castro Teixeira on 08/08/23.
//

import SwiftUI

struct BiggerSmallerGameView: View {
    
    @State private var isShowingPause = false
    @State private var isShowingInstructions = false
    @State private var isShowingInitialInstructions = true
    var dismissAction: (() -> Void)
    
    @State private var option : [Int] = [ 3, 9]
    
    func generateRandomValues() -> [Int] {
        let minValue = 3
        let maxValue = 9

        var randomNumber1 = Int.random(in: minValue...maxValue)
        var randomNumber2 = Int.random(in: minValue...maxValue)

        // Certifique-se de que os números são diferentes
        while randomNumber2 == randomNumber1 {
            randomNumber2 = Int.random(in: minValue...maxValue)
        }

        return [randomNumber1, randomNumber2]
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                VStack {
                    Button(action: {
                        isShowingPause.toggle()
                    }) {
                        Image("PauseButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.05)
                    }
                    
                    Spacer()
                    Button(action: {
                        isShowingInstructions.toggle()
                    }) {
                        Image("InfoButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.05)
                    }
                }
                VStack{
                    Text("Selecione a opção verdadeira:")
                        .font(Font.titleLargeBold)
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            Image("GreenTan")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.2)
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Spacer()
                            HStack{
                                Image("Shapes\(option[0])")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.2)
                                Image("GreaterSymbol")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.2)
                                Image("Shapes\(option[1])")                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.2)
                            }
                            .onTapGesture {
                                if(option[0]>option[1]) {
                                    option = generateRandomValues()
                                    print("certa")
                                }
                            }
                            Spacer()
                            HStack{
                                Image("Shapes\(option[0])")                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.2)
                                Image("MinorSymbol")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.2)
                                Image("Shapes\(option[1])")                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.2)
                            }
                            .onTapGesture {
                                if(option[0]<option[1]) {
                                    option = generateRandomValues()
                                    print("certa")
                                }
                            }
                            Spacer()
                        }
                        Spacer()

                    }
                }
            }
            .padding()
        }
        .onAppear(){
            option = generateRandomValues()
        }
        .ignoresSafeArea(.all)
        .popupNavigatopnView(show: $isShowingPause){ PauseModalView(show: $isShowingPause, shuffleGame: {option = generateRandomValues()}, dismissGame: dismissAction)}
        .popupNavigatopnView(show: $isShowingInitialInstructions){ BiggerSmallerInstructionModal(dismissInstruction: {isShowingInitialInstructions = false})}
        .popupNavigatopnView(show: $isShowingInstructions){ BiggerSmallerInterrogationModal(dismissInstruction: {isShowingInstructions = false})}
    }
    
}

struct BiggerSmallerGameView_Previews: PreviewProvider {
    static var previews: some View {
        BiggerSmallerGameView(dismissAction: {true})
    }
}
