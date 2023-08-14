import SwiftUI

struct TrueFalseTryAgainModal: View {
    var dismissTryAgain: (() -> Void)
    
    var body: some View {
        
        Button(action: {
            dismissTryAgain()
       
        }) {
            GeometryReader { geometry in
                ZStack(alignment: .top){
                    
                    VStack{
                        Spacer().frame(height: geometry.size.height * 0.07)
                        VStack {
                            Spacer().frame(height: geometry.size.height * 0.07)

                            Text("Lessons")
                                .bold()
                                .font(.title2)

                            Spacer().frame(height:geometry.size.height * 0.06)
                            
                            Text("TapToContinue")
                                .font(Font.titleNormalBold)
                        }
                        .padding(30)
                        .frame(width: geometry.size.width / 1.5, height: geometry.size.height / 1.8)
                        .background(Color("lightBackground"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.teal, lineWidth: 10)
                        )
                        .cornerRadius(20)
                        
                    }
                    
                
                    Text("TryAgain")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.title2)
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

struct TrueFalseTryAgainModal_Previews: PreviewProvider {
    static var previews: some View {
        TrueFalseTryAgainModal(dismissTryAgain: {})
    }
}

