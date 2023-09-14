import SwiftUI

struct CompleteModalView: View {
    var dismissComplete: (() -> Void)
    var dismissGame: (() -> Void)
    var shuffleGame: (() -> Void)
    var gameName: Int
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .top){
                
                VStack{
                    Spacer().frame(height: geometry.size.height * 0.07)
                    VStack {
                        ZStack{
                            Image("game\(gameName)0")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: geometry.size.height * 0.5)
                                .padding(.bottom,geometry.size.height * 0.08)
                            
                            
                            VStack{
                                Spacer()
                                HStack (spacing: 30){
                                   
                                    
                                    
                                    HomeButton(title: "Quit", color: Color.red, largura: geometry.size.width * 0.22, altura: geometry.size.height * 0.12, action: {
                                        HapticFeedbackManager.shared.hapticFeedback()
                                        dismissGame();dismissComplete()
                                    })
                                    
                                    HomeButton(title: "PlayAgain", color: Color.blue, largura: geometry.size.width * 0.22, altura: geometry.size.height * 0.12, action: {
                                        HapticFeedbackManager.shared.hapticFeedback()
                                        shuffleGame();dismissComplete()
                                    })
                                }
                                .padding(.bottom,geometry.size.height * 0.0)
                            }
                        }
                        
                        
                       
                        
                    }
                    
                    .padding(30)
                    .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 1.3)
                    .background(Color("lightBackground"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.teal, lineWidth: 10)
                    )
                    .cornerRadius(20)
                }
                
                
                Text("Congrats!")
                    .foregroundColor(Color.white)
                    .font(Font.titleNormalBold1)
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.14)
                    .background(Color.teal)
                    .cornerRadius(10)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
        
    }
}

struct CompleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteModalView(dismissComplete: {}, dismissGame: {}, shuffleGame: {}, gameName: 0)
    }
}
