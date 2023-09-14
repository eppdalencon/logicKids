import SwiftUI

struct BiggerSmallerInterrogationModal: View {
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
                            Spacer()//.frame(height: geometry.size.height * 0.2)
                            GifImage("gameinstruction3")
                                .frame(width: geometry.size.width * 0.45, height: geometry.size.height * 0.40)
                            Spacer()//.frame(height:geometry.size.height * 0.01)
                            Text(String(localized: "GameOneInstructionTapToClose"))
                                .font(.title3)
                                .bold()
                        }
                        .padding(30)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height / 1.5)
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

struct BiggerSmallerInterrogationModal_Previews: PreviewProvider {
    static var previews: some View {
        BiggerSmallerInterrogationModal(dismissInstruction: {})
    }
}
