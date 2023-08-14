import SwiftUI

struct TrueFalseInterrogationModal: View {
    var dismissInstruction: (() -> Void)
    
    var body: some View {
        
        Button(action: {
            dismissInstruction()
       
        }) {
            GeometryReader { geometry in
                ZStack(alignment: .top){
                    
                    VStack{
                        Spacer().frame(height: geometry.size.height * 0.07)
                        VStack {
                            Spacer().frame(height: geometry.size.height * 0.07)

                            ZStack{
                                Image("TrueFalseInstruction")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.width)
                                    
                                Text("TapToReturn")
                                    .font(Font.titleNormalBold)
                                    .padding(.top, geometry.size.height * 0.5)
                            }
                            
                            
                            Spacer().frame(height:geometry.size.height * 0.06)
                            
                            Text("TapToContinue")
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
                    
                    
                    Text("HowToPlay")
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

struct TrueFalseInterrogationModal_Previews: PreviewProvider {
    static var previews: some View {
        TrueFalseInterrogationModal(dismissInstruction: {})
    }
}
