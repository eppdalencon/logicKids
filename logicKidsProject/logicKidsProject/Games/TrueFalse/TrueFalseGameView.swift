//
//  TrueFalseGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 07/08/23.
//


import SwiftUI

struct QuestionTF {
    var questionInt : Int
    var questionColor : [String] = []
    var questionMood : [String] = []
    var questionAccessory : [String] = []

    
    let questionText : String
    

    init(quest: Int, colorTrue: String, colorFalse: String, moodTrue: String, moodFalse: String, accessoryTrue: String, accessoryFalse: String) {
        self.questionInt = quest
        self.questionText = "game2-\(quest)"
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
    
    @State private var questionObject: QuestionTF = QuestionTF(quest: 1, colorTrue: "The shape is green", colorFalse: "The shape is red", moodTrue: "The shape is sleepy", moodFalse: "The shape is angry", accessoryTrue: "The shape is not wearing anything", accessoryFalse: "The shape is wearing sneakers")
    
    @State private var answer1: Int?
    @State private var answer2: Int?
    @State private var answer3: Int?
    
    
    @State private var isShowingPause = false
    @State private var isShowingCongratulation = false
    @State private var isShowingInitialInstructions = true
    @State private var isShowingInstructions = false
    var dismissAction: (() -> Void)
    
    var numberOfTansForQuest: [Int] = [ 7, 5, 6, 4, 6, 5, 7, 6, 4, 7]
    
    @State private var selectedImageIndex: Int? = nil
    
    //lista de questoes
    @State var questionSelected : Int = 0
    
    func retryGame(){
        
    }
    
    func newGame(){
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
            HStack{
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
                .frame(width:geometry.size.width * 0.1 ,height: geometry.size.height * 0.9)
                //.background(Color.green)
                
                
                
                VStack {
                    Image("GreenTan")
                        .resizable()
                    
                }
                .frame(width:geometry.size.width * 0.35 ,height: geometry.size.height * 0.9)
                //.background(Color.red)
               // Spacer()
                
                
                VStack {
                    HStack{
                        Text(questionObject.questionColor[answerArray[0]])
                        Spacer()
                        HStack{
                            Button(action: {
                                answer1 = 1
                            }) {
                               Text("V")
                                    .foregroundColor(Color.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(answer1 == 1 ? Color.green : Color.gray )
                                    
                                    .cornerRadius(5)
                            }
                            
                            Button(action: {
                                answer1 = 0
                            }) {
                               Text("F")
                                    .foregroundColor(Color.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(answer1 == 0 ? Color.red : Color.gray )
                                    .cornerRadius(5)
                            }
                        }
                    }
                    
                    
                    HStack{
                        Text(questionObject.questionMood[answerArray[1]])
                        Spacer()
                        HStack{
                            Button(action: {
                                answer2 = 1
                            }) {
                               Text("V")
                                    .foregroundColor(Color.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(answer2 == 1 ? Color.green : Color.gray )
                                    .cornerRadius(5)
                                    
                            
                            }
                            
                            Button(action: {
                                answer2 = 0
                            }) {
                               Text("F")
                                    .foregroundColor(Color.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(answer2 == 0 ? Color.red : Color.gray )
                                    .cornerRadius(5)
                            }
                        }
                    }
                    
                    
                    HStack{
                        Text(questionObject.questionAccessory[answerArray[2]])
                        Spacer()
                        HStack{
                            Button(action: {
                                answer3 = 1
                            }) {
                               Text("V")
                                    .foregroundColor(Color.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(answer3 == 1 ? Color.green : Color.gray )
                                    .cornerRadius(5)
                                    
                            
                            }
                            
                            Button(action: {
                                answer3 = 0
                            }) {
                               Text("F")
                                    .foregroundColor(Color.white)
                                    .padding(5)
                                    .padding(.horizontal, 10)
                                    .background(answer3 == 0 ? Color.red : Color.gray )
                                    .cornerRadius(5)
                            
                            }
                            
                        }
                    }
                    
                    Spacer()
                        .frame(height: geometry.size.height * 0.2)
                    
                    Button(action: {
                        if (answer1 != nil && answer2 != nil && answer3 != nil){
                            if([answer1, answer2, answer3] == answerArray){
                                print("Respostas corretas")
                            } else {
                                print("Resposta errada")
                            }
                        } else {
                            print("Preencha todas as respostas")
                        }
                    }) {
                       Text("Submit Answer")
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background((answer1 != nil && answer2 != nil && answer3 != nil) ? Color.orange : Color.gray)
                            .cornerRadius(5)
                            .frame(width: geometry.size.width * 0.4)
                    
                    }
                   
                    
                    
                    
                }
                .frame(width:geometry.size.width * 0.4 ,height: geometry.size.height * 0.9)
               // .background(Color.red)
               // Spacer()
            }
            //.padding(.vertical,32) //IPHONE GSTV
            .padding()
            .onAppear(){
                newGame()
                print(answerArray)
                //objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .popupNavigatopnView(show: $isShowingPause){ PauseModalView(show: $isShowingPause, shuffleGame: newGame, dismissGame: dismissAction)}
        .popupNavigatopnViewFull(show: $isShowingCongratulation) {
           // CompleteModalView(dismissComplete: {isShowingCongratulation = false}, dismissGame: dismissAction, shuffleGame: retryGame,gameName: questionLevel[questionSelected].questionInt)
        }
        .popupNavigatopnView(show: $isShowingInitialInstructions){ TrueFalseInstructionModal(dismissInstruction: {isShowingInitialInstructions = false})}
        .popupNavigatopnView(show: $isShowingInstructions){ TrueFalseInterrogationModal(dismissInstruction: {isShowingInstructions = false})}
    }
}



struct TrueFalseGameView_Previews: PreviewProvider {
    static var previews: some View {
        TrueFalseGameView(dismissAction: {true}).previewInterfaceOrientation(.landscapeLeft)
    }
}

