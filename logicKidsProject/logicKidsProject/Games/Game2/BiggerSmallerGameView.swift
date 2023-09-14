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
    @State private var isShowingCongratulation = false

    var dismissAction: (() -> Void)
    
    @State private var option : [Int] = [ 3, 9]
    @State private var topOption: Bool = false
    @State private var colorOption1 : Bool = false
    @State private var colorOption2 : Bool = false
    @State private var bottomOption: Bool = false

    
    func generateRandomValues() -> [Int] {
        let minValue = 3
        let maxValue = 9

        let randomNumber1 = Int.random(in: minValue...maxValue)
        var randomNumber2 = Int.random(in: minValue...maxValue)

        // Certifique-se de que os números são diferentes
        while randomNumber2 == randomNumber1 {
            randomNumber2 = Int.random(in: minValue...maxValue)
        }

        return [randomNumber1, randomNumber2]
    }
    
    func retry(){
        option = generateRandomValues()
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            HStack{
                VStack {
                    Button(action: {
                        HapticFeedbackManager.shared.hapticFeedback()
                        isShowingPause.toggle()
                    }) {
                        Image("PauseButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.05)
                    }
                    Spacer()
                    Button(action: {
                        HapticFeedbackManager.shared.hapticFeedback()
                        isShowingInstructions.toggle()
                    }) {
                        Image("InfoButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.05)
                    }
                }
                VStack{
                    HStack{
                        Text(String(localized: "WhichSideHasABiggerQuantity"))
                            .font(Font.titleNormalBold1)
                    }
                    HStack{
                        Spacer()
                        VStack{
                            Spacer()
                            Image("TanGame3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.2)
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            Spacer()
                            VStack{
                                Spacer().frame(height: geometry.size.width * 0.01)
                                HStack{
                                    Spacer().frame(width: geometry.size.width * 0.03)
                                    Image("Shapes\(option[0])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.23)
                                    Image(colorOption1 ? "GreaterWhite" : "Greater")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.15)
                                    Image("Shapes\(option[1])")               .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.23)
                                    Spacer().frame(width: geometry.size.width * 0.03)
                                }
                                Spacer().frame(height: geometry.size.width * 0.01)
                            }
                            .background(colorOption1 ? Color("blueTan") : Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 20)
                            .saturation(topOption ? 0 : 1.0)
                            .onTapGesture {
                                HapticFeedbackManager.shared.hapticFeedback()
                                if(option[0]>option[1]) {
                                    colorOption1 = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        colorOption1 = false // Reset the selected image index after 2 seconds
                                        isShowingCongratulation = true
                                    }
                                } else {
                                    colorOption1 = false // Reset the selected image index after 2 seconds
                                    topOption = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        topOption = false // Reset the selected image index after 2 seconds
                                    }
                                }
                            }
                            Spacer()
                            VStack{
                                Spacer().frame(height: geometry.size.width * 0.01)
                                HStack{
                                    Spacer().frame(width: geometry.size.width * 0.03)
                                    Image("Shapes\(option[0])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.23)
                                    Image(colorOption2 ? "LesserWhite" : "Lesser")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.15)
                                    Image("Shapes\(option[1])")                   .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: geometry.size.height * 0.23)
                                    Spacer().frame(width: geometry.size.width * 0.03)
                                }
                                Spacer().frame(height: geometry.size.width * 0.01)
                            }
                            .background(colorOption2 ? Color("blueTan") : Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 20)                            .saturation(bottomOption ? 0.0 : 1.0)
                            .onTapGesture {
                                HapticFeedbackManager.shared.hapticFeedback()
                                if(option[0]<option[1]) {
                                    colorOption2 = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        colorOption2 = false // Reset the selected image index after 2 seconds
                                        isShowingCongratulation = true
                                    }
                                } else {
                                    colorOption2 = false // Reset the selected image index after 2 seconds
                                    bottomOption = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        bottomOption = false // Reset the sel   ected image index after 2 seconds
                                    }
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
            .padding(.vertical,32)
            .padding(.horizontal,32)
        }
        .onAppear(){
            option = generateRandomValues()
        }
        .ignoresSafeArea(.all)
        .background(Color("backgroundColor"))
        .popupNavigatopnView(show: $isShowingPause){ PauseModalView(show: $isShowingPause, shuffleGame: {option = generateRandomValues()}, dismissGame: dismissAction)}
        .popupNavigatopnViewFull(show: $isShowingCongratulation) {
            BiggerSmallerCongratulationModal(dismissComplete: {isShowingCongratulation = false}, dismissGame: dismissAction, shuffleGame: retry,
                                             numberShow: option)
        }
        .popupNavigatopnView(show: $isShowingInitialInstructions){ BiggerSmallerInstructionModal(dismissInstruction: {isShowingInitialInstructions = false})}
        .popupNavigatopnView(show: $isShowingInstructions){ BiggerSmallerInterrogationModal(dismissInstruction: {isShowingInstructions = false})}
    }
    
}

struct BiggerSmallerGameView_Previews: PreviewProvider {
    static var previews: some View {
        BiggerSmallerGameView(dismissAction: {true})
    }
}
