import SwiftUI

struct TrueFalseCompleteModalView: View {
    var dismissComplete: (() -> Void)
    var dismissGame: (() -> Void)
    var shuffleGame: (() -> Void)
    var gameName: String
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .top){
                VStack{
                    Spacer().frame(height: geometry.size.height * 0.07)
                    VStack {
                        ZStack{
                            HStack(spacing:0){
                                Image("\(gameName)_star")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.4)
                                    .padding(.bottom,geometry.size.height * 0.08)
                                
                                
                                Text("Congratulations")
                                    .padding(.bottom, 40)
                                    .bold()
                                    .font(.title2)
                            }
                            
                            
                            
                            VStack{
                                Spacer()
                                HStack (spacing: 30){
                                   
                                    
                                    
                                    HomeButton(title: "Quit", color: Color.red, largura: geometry.size.width * 0.22, altura: geometry.size.height * 0.12, action: {
                                        dismissGame();dismissComplete()
                                    })
                                    
                                    HomeButton(title: "PlayAgain", color: Color.blue, largura: geometry.size.width * 0.22, altura: geometry.size.height * 0.12, action: {
                                        shuffleGame();dismissComplete()
                                    })
        //
                                }
                                .padding(.bottom,geometry.size.height * 0.0)
                            }
                        }
                        
                        
                       
                        
                    }
                    
                    .padding(30)
                    .frame(width: geometry.size.width / 1.4, height: geometry.size.height / 1.4)
                    .background(Color("lightBackground"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.teal, lineWidth: 10)
                    )
                    .cornerRadius(20)
                }
                
                
                Text("Congrats!")
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
}

struct TrueFalseCompleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        TrueFalseCompleteModalView(dismissComplete: {}, dismissGame: {}, shuffleGame: {}, gameName: "happy1")
    }
}

