//
//  TrueFalseGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 07/08/23.
//


import SwiftUI

struct QuestionTF {
    var imageName : String
    var questionColor : [LocalizedStringKey] = []
    var questionMood : [LocalizedStringKey] = []
    var questionAccessory : [LocalizedStringKey] = []

    init(imageName: String, colorTrue: LocalizedStringKey, colorFalse: LocalizedStringKey, moodTrue: LocalizedStringKey, moodFalse: LocalizedStringKey, accessoryTrue: LocalizedStringKey, accessoryFalse: LocalizedStringKey) {
        self.imageName = imageName
        self.questionColor.insert(colorFalse, at: 0)
        self.questionColor.insert(colorTrue, at: 1)
        self.questionMood.insert(moodFalse, at: 0)
        self.questionMood.insert(moodTrue, at: 1)
        self.questionAccessory.insert(accessoryFalse, at: 0)
        self.questionAccessory.insert(accessoryTrue, at: 1)
    }
    
}

struct TrueFalseGameView: View {
    
    @State private var answerArray: [Int] = [0,0,0]
    
    @State private var questionsArray: [QuestionTF] = [QuestionTF(imageName: "angry1", colorTrue: "DavidIsATriangle", colorFalse: "DavidIsAParallelogram", moodTrue: "DavidIsAngry", moodFalse: "DavidIsHappy", accessoryTrue: "DavidIsWearingAHat", accessoryFalse: "DavidIsWearingAFlower"),
        
       QuestionTF(imageName: "angry2", colorTrue: "TaylorIsATriangle", colorFalse: "TaylorIsASquare", moodTrue: "TaylorIsAngry", moodFalse: "TaylorIsSleeping", accessoryTrue: "TaylorIsWearingACrown", accessoryFalse: "TaylorIsWearingACap"),
                                                       
       QuestionTF(imageName: "happy1", colorTrue: "JonhIsASquare", colorFalse: "JonhIsATriangle", moodTrue: "JonhIsHappy", moodFalse: "JonhIsAngry", accessoryTrue: "JonhIsWearingAHat", accessoryFalse: "JonhIsWearingGlasses"),
                                                       
       QuestionTF(imageName: "angry2", colorTrue: "SarahIsATriangle", colorFalse: "SarahIsASquare", moodTrue: "SarahIsHappy", moodFalse: "SarahIsWinking", accessoryTrue: "SarahIsWearingCrown", accessoryFalse: "SarahIsWearingAHat"),
                                                       
       QuestionTF(imageName: "happy3", colorTrue: "ChrisIsASquare", colorFalse: "ChrisIsAHexagon", moodTrue: "ChrisIsHappy", moodFalse: "ChrisIsWinking", accessoryTrue: "ChrisIsWearingSunglasses", accessoryFalse: "ChrisIsWearingACap"),
                                                       
       QuestionTF(imageName: "sleeping1", colorTrue: "SkylerIsATriangle", colorFalse: "SkylerIsASquare", moodTrue: "SkylerIsSleeping", moodFalse: "SkylerIsAngry", accessoryTrue: "SkylerIsWearingAFlower", accessoryFalse: "SkylerIsWearingAHat"),
                                                       
       QuestionTF(imageName: "sleeping2", colorTrue: "DaveIsAParallelogram", colorFalse: "DaveIsATriangle", moodTrue: "DaveIsSleeping", moodFalse: "DaveIsSurprised", accessoryTrue: "DaveIsWearingACap", accessoryFalse: "DaveIsWearingAFlower"),
                                                       
       QuestionTF(imageName: "surprised1", colorTrue: "JennIsATriangle", colorFalse: "JennIsACircle", moodTrue: "JennIsSurprised", moodFalse: "JennIsHappy", accessoryTrue: "JennIsWearingAFlower", accessoryFalse: "JennIsWearingGlasses"),
                                                       
       QuestionTF(imageName: "surprised2", colorTrue: "MikeIsATriangle", colorFalse: "MikeIsSquare", moodTrue: "MikeIsSurprised", moodFalse: "MikeIsAngry", accessoryTrue: "MikeIsWearingACap", accessoryFalse: "MikeIsWearingACrown"),
                                                       
       QuestionTF(imageName: "surprised3", colorTrue: "GregIsATriangle", colorFalse: "GregIsAParallelogram", moodTrue: "GregIsSurprised", moodFalse: "GregIsSleeping", accessoryTrue: "GregIsWearingGlasses", accessoryFalse: "GregIsWearingAHat"),
                                                       
       QuestionTF(imageName: "winking1", colorTrue: "LindaIsAParallelogram", colorFalse: "LindaIsATriangle", moodTrue: "LindaIsWinking", moodFalse: "LindaIsSurprised", accessoryTrue: "LindaIsWearingAFlower", accessoryFalse: "LindaIsWearingGlasses"),
                                                       
       QuestionTF(imageName: "winking2", colorTrue: "AlexIsATriangle", colorFalse: "AlexIsAPentagon", moodTrue: "AlexIsWinking", moodFalse: "AlexIsAngry", accessoryTrue: "AlexIsWearingACrown", accessoryFalse: "AlexIsWearingSunglasses")
                                                       
                                                       
    ]
    
    
    
    @State private var answer1: Int?
    @State private var answer2: Int?
    @State private var answer3: Int?
    
    @State private var questionNumber: Int = 1
    
    
    @State private var isShowingPause = false
    @State private var isShowingCongratulation = false
    @State private var isShowingInitialInstructions = true
    @State private var isShowingInstructions = false
    @State private var isShowingTryAgain = false
    var dismissAction: (() -> Void)
    
    var numberOfTansForQuest: [Int] = [ 7, 5, 6, 4, 6, 5, 7, 6, 4, 7]
    
    @State private var selectedImageIndex: Int? = nil
    
    //lista de questoes
    @State var questionSelected : Int = 0
    
    func retryGame(){
        
    }
    
    func newGame(){
        questionNumber = Int.random(in: 0...11)
        var randomArray: [Int] = []
        for _ in 1...3 {
            let randomValue = Int.random(in: 0...1)
            randomArray.append(randomValue)
        }
        
        answerArray = randomArray
        answer1 = nil
        answer2 = nil
        answer3 = nil
    }


    var body: some View {
        GeometryReader { geometry in
            HStack(spacing:0){
                VStack {
                    Button(action: {
                        isShowingPause.toggle()
                    }) {
                        Image("PauseButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.05)
                    }
                    
                    Spacer()
                    Button(action: {
                        isShowingInstructions.toggle()
                    }) {
                        Image("InfoButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.05)
                    }
                    
                }
                
                .frame(width:geometry.size.width * 0.09 ,height: geometry.size.height * 0.88)
                .padding(.bottom, geometry.size.height * 0.08)
                //.padding(.vertical, geometry.size.height * 0.08)
                //.background(Color.green)
                
                VStack(spacing:0){
                    Text("SelectTrueOrFalse")
                        .font(Font.titleLargeBold)
                        .frame(width:geometry.size.width * 0.85 ,height: geometry.size.height * 0.08)
                        .padding(.top,10)
                        .padding(.bottom,-15)
                    HStack{
                        VStack(alignment: .leading) {
                            Image(questionsArray[questionNumber].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                                //.background(Color.red)
                            
                        }
                        .frame(width:geometry.size.width * 0.35)
                        .padding(.bottom, geometry.size.height * 0.12)
                        
                        
                        //.background(Color.red)
                       // Spacer()
                        
                        
                        VStack(spacing:geometry.size.height * 0.05) {
                            HStack{
                                Text(questionsArray[questionNumber].questionColor[answerArray[0]])
                                    .bold()
                                Spacer()
                                HStack(spacing: 3){
                                    Button(action: {
                                        answer1 = 1
                                    }) {
                                       Text("True")
                                            .font(Font.titleNormalBold)
                                            .frame(width:geometry.size.width * 0.06, height: geometry.size.height * 0.08)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .padding(.horizontal, 10)
                                            .background(answer1 == 1 ? Color.green : Color("systemGray") )
                                            .roundedCorner(10, corners: [.bottomLeft, .topLeft])
                                    }
                                    
                                    Button(action: {
                                        answer1 = 0
                                    }) {
                                       Text("False")
                                            .font(Font.titleNormalBold)
                                            .frame(width:geometry.size.width * 0.06, height: geometry.size.height * 0.08)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .padding(.horizontal, 10)
                                            .background(answer1 == 0 ? Color.red : Color("systemGray") )
                                            .roundedCorner(10, corners: [.bottomRight, .topRight])
                                    }
                                  
                                }
                            }
                            .frame(width: geometry.size.width * 0.47)
                            .padding(3)
                            .padding(.leading,10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            
                            HStack{
                                Text(questionsArray[questionNumber].questionMood[answerArray[1]])
                                    .bold()
                                Spacer()
                                HStack(spacing: 3){
                                    Button(action: {
                                        answer2 = 1
                                    }) {
                                       Text("True")
                                            .font(Font.titleNormalBold)
                                            .frame(width:geometry.size.width * 0.06, height: geometry.size.height * 0.08)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .padding(.horizontal, 10)
                                            .background(answer2 == 1 ? Color.green : Color("systemGray") )
                                            .roundedCorner(10, corners: [.bottomLeft, .topLeft])
                                            
                                    
                                    }
                                    
                                    Button(action: {
                                        answer2 = 0
                                    }) {
                                       Text("False")
                                            .font(Font.titleNormalBold)
                                            .frame(width:geometry.size.width * 0.06, height: geometry.size.height * 0.08)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .padding(.horizontal, 10)
                                            .background(answer2 == 0 ? Color.red : Color("systemGray") )
                                            .roundedCorner(10, corners: [.bottomRight, .topRight])
                                    }
                                }
                            }
                            .frame(width: geometry.size.width * 0.47)
                            .padding(3)
                            .padding(.leading,10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            
                            
                            HStack{
                                Text(questionsArray[questionNumber].questionAccessory[answerArray[2]])
                                    .bold()
                                Spacer()
                                HStack(spacing: 3){
                                    Button(action: {
                                        answer3 = 1
                                    }) {
                                       Text("True")
                                            .font(Font.titleNormalBold)
                                            .frame(width:geometry.size.width * 0.06, height: geometry.size.height * 0.08)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .padding(.horizontal, 10)
                                            .background(answer3 == 1 ? Color.green : Color("systemGray") )
                                            .roundedCorner(10, corners: [.bottomLeft, .topLeft])
                                            
                                    
                                    }
                                    
                                    Button(action: {
                                        answer3 = 0
                                    }) {
                                       Text("False")
                                            .font(Font.titleNormalBold)
                                            .frame(width:geometry.size.width * 0.06, height: geometry.size.height * 0.08)
                                            .foregroundColor(Color.white)
                                            .padding(5)
                                            .padding(.horizontal, 10)
                                            .background(answer3 == 0 ? Color.red : Color("systemGray") )
                                            .roundedCorner(10, corners: [.bottomRight, .topRight])
                                    
                                    }
                                    
                                }
                                
                            }
                            .frame(width: geometry.size.width * 0.47)
                            .padding(3)
                            .padding(.leading,10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            
                            
                            
                            
                            Button(action: {
                                if (answer1 != nil && answer2 != nil && answer3 != nil){
                                    if([answer1, answer2, answer3] == answerArray){
                                        isShowingCongratulation = true
                                    } else {
                                        isShowingTryAgain = true
                                    }
                                } else {
                                    print("Preencha todas as respostas")
                                }
                            }) {
                               Text("SendAnswer")
                                    .bold()
                                    .frame(width: geometry.size.width * 0.47, height: geometry.size.height * 0.08)
                                    .padding(10)
                                    .foregroundColor(Color.white)
                                    .background((answer1 != nil && answer2 != nil && answer3 != nil) ? Color("blueTan") : Color("systemGray"))
                                    .cornerRadius(10)
                                    .shadow(color: (answer1 != nil && answer2 != nil && answer3 != nil) ? Color("blueTan").opacity(0.5) : Color("systemGray").opacity(0.5),radius: 0.0, x: 6, y: 6)
                                    
                            
                            }
                           
                            
                            
                            
                        }
                        .frame(width:geometry.size.width * 0.5 ,height: geometry.size.height * 0.9)
                       // .background(Color.red)
                       // Spacer()
                    }
                    .frame(width:geometry.size.width * 0.85)
                    
                }
                .frame(width:geometry.size.width * 0.85)
                
                
            }
//            .padding(.vertical,32) //IPHONE GSTV
//            .padding(.horizontal,32)
            .padding()
            .onAppear(){
                newGame()
                print(answerArray)
                //objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color("backgroundColor"))
        .navigationBarBackButtonHidden(true)
        .popupNavigatopnView(show: $isShowingPause){ PauseModalView(show: $isShowingPause, shuffleGame: newGame, dismissGame: dismissAction)}
        .popupNavigatopnViewFull(show: $isShowingCongratulation) {
            TrueFalseCompleteModalView(dismissComplete: {isShowingCongratulation = false}, dismissGame: dismissAction, shuffleGame: newGame,gameName: questionsArray[questionNumber].imageName.components(separatedBy: ".").first!)
        }
        .popupNavigatopnView(show: $isShowingInitialInstructions){ TrueFalseInstructionModal(dismissInstruction: {isShowingInitialInstructions = false})}
        .popupNavigatopnView(show: $isShowingInstructions){ TrueFalseInterrogationModal(dismissInstruction: {isShowingInstructions = false})}
        .popupNavigatopnView(show: $isShowingTryAgain){ TrueFalseTryAgainModal(dismissTryAgain: {isShowingTryAgain = false})}
    }
}



struct TrueFalseGameView_Previews: PreviewProvider {
    static var previews: some View {
        TrueFalseGameView(dismissAction: {true}).previewInterfaceOrientation(.landscapeLeft)
    }
}

