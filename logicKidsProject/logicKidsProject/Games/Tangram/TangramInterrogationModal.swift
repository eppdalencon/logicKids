import SwiftUI

struct TangramInterrogationModal: View {
    var dismissInstruction: (() -> Void)
    
    var body: some View {
        
        Button(action: {
            dismissInstruction()
       
        }) {
            GeometryReader { geometry in
                ZStack(alignment: .top){
                    
                    VStack{
                        Spacer().frame(height: geometry.size.height * 0.05)
                        VStack {
                            Spacer().frame(height: geometry.size.height * 0.07)
                            GifImage("gameinstruction1")
                                .frame(width: geometry.size.width * 0.35, height: geometry.size.height * 0.45)
                            Spacer().frame(height:geometry.size.height * 0.02)
                            
                            Text(String(localized: "GameOneInstructionTapToClose"))
                                .font(.title3)
                                .bold()
                        }
                        .padding(30)
                        .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 1.5)
                        .background(Color("lightBackground"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.teal, lineWidth: 10)
                        )
                        .cornerRadius(20)
                        
                    }
                    
                    
                    Text(String(localized: "GameOneInstructionTitleHowToPlay"))
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
        .buttonStyle(.plain)
        
        
        
        
    }
}

struct TangramInterrogationModal_Previews: PreviewProvider {
    static var previews: some View {
        TangramInterrogationModal(dismissInstruction: {})
    }
}
