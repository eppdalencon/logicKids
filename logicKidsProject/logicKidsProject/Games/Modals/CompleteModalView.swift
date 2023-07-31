import SwiftUI

struct CompleteModalView: View {
    var dismissComplete: (() -> Void)
    var dismissGame: (() -> Void)
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea() // Add a semi-transparent background
            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack (spacing: 20){
                    Button(action: {
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
            
             // Set the frame to take the whole screen
        }
        .background(Color.red)
    }
}

struct CompleteModalView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteModalView(dismissComplete: {}, dismissGame: {})
    }
}
