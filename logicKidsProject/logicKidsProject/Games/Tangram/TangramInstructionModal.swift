import SwiftUI

struct TangramInstructionModal: View {
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
                                Image("GreenTan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.12)
                                ZStack{
                                    
                                    Image("PurpleBubble")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width * 0.45)
                                    
                                    Text(String(localized: "GameOneInstructionTextHowToPlay"))
                                        .font(Font.titleMiddleBold)
                                        .padding(30)
                                }
                            }

                            Spacer().frame(height:geometry.size.height * 0.06)
                            
                            Text(String(localized: "GameOneInstructionTapToContinue"))
                                .font(Font.titleNormalBold)
                        }
                        .padding(30)
                        .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 1.5)
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

struct TangramInstructionModal_Previews: PreviewProvider {
    static var previews: some View {
        TangramInstructionModal(dismissInstruction: {})
    }
}
