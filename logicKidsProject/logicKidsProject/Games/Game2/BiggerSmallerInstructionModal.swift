import SwiftUI

struct BiggerSmallerInstructionModal: View {
    var dismissInstruction: (() -> Void)
    
    var body: some View {
        
        Button(action: {
            HapticFeedbackManager.shared.hapticFeedback()
            dismissInstruction()
        }) {
            GeometryReader { geometry in
                ZStack(alignment: .top){
                    
                    VStack{
                        Spacer().frame(height: geometry.size.height * 0.07)
                        VStack {
                            Spacer().frame(height: geometry.size.height * 0.07)

                            HStack{
                                Image("TanInstruction")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.12)
                                ZStack{
                                    Image("InstructionGame3")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.45)
                                    
                                    Text(String(localized: "GameThreeInstructionTextHowToPlay"))
                                        .font(Font.titleMiddleBold)
                                        //.foregroundColor(.white)
                                        .padding(30)
                                }
                            }

                            Spacer().frame(height:geometry.size.height * 0.06)
                            
                            Text(String(localized: "GameOneInstructionTapToContinue"))
                                .font(Font.titleNormalBold)
                        }
                        .padding(30)
                        .frame(width: geometry.size.width * 0.66, height: geometry.size.height / 1.5)
                        .background(Color("backgroundColor"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.teal, lineWidth: 10)
                        )
                        .cornerRadius(20)
                        
                    }
                    
                
                    Text(String(localized: "HowToPlay"))
                        .foregroundColor(Color.white)
                        .font(Font.titleNormalBold1)
                        .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.14)
                        .background(Color.teal)
                        .cornerRadius(10)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .buttonStyle(.plain)
        
        
        
        
    }
}

struct BiggerSmallerInstructionModal_Previews: PreviewProvider {
    static var previews: some View {
        BiggerSmallerInstructionModal(dismissInstruction: {})
    }
}
