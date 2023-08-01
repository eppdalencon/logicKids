import SwiftUI

struct CompleteModalView: View {
    var dismissComplete: (() -> Void)
    var dismissGame: (() -> Void)
    var shuffleGame: (() -> Void)
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .top){
                
                VStack{
                    Spacer().frame(height: geometry.size.height * 0.07)
                    VStack {
                        Text("Congratulations!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        HStack (spacing: 20){
                            Button(action: {
                                shuffleGame()
                                dismissComplete()
                            }) {
                                Text("Retry")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                withAnimation {
                                    dismissGame()
                                    dismissComplete()
                                }
                            }) {
                                Text("New Game")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                        }
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
        CompleteModalView(dismissComplete: {}, dismissGame: {}, shuffleGame: {})
    }
}
