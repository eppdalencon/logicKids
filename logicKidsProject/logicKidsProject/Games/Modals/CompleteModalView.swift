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
                                   
                                    
                                    
                                    HomeButton(title: "Quit", color: Color.red, largura: geometry.size.width * 0.2, altura: geometry.size.height * 0.1, action: {
                                        dismissGame();dismissComplete()
                                    })
                                    
                                    HomeButton(title: "Play Again", color: Color.blue, largura: geometry.size.width * 0.2, altura: geometry.size.height * 0.1, action: {
                                        shuffleGame();dismissComplete()
                                    })
        //                            Button(action: {
        //                                withAnimation {
        //                                    dismissGame()
        //                                    dismissComplete()
        //                                }
        //                            }) {
        //                                Text("Quit")
        //                                    .padding()
        //                                    .foregroundColor(.white)
        //                                    .background(Color.blue)
        //                                    .cornerRadius(10)
        //                            }
        //
        //                            Button(action: {
        //                                shuffleGame()
        //                                dismissComplete()
        //                            }) {
        //                                Text("Play Again")
        //                                    .padding()
        //                                    .foregroundColor(.white)
        //                                    .background(Color.blue)
        //                                    .cornerRadius(10)
        //                            }
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

struct CompleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteModalView(dismissComplete: {}, dismissGame: {}, shuffleGame: {}, gameName: 0)
    }
}
