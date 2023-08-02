//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct QuestionsLevelOne {
    var questionInt : Int
    var question : String
    var answerInt : Int
    var answer : String

    
    let questionText : String = "game"
    let answerText : String = "answer0"

    init(quest: Int, opt: Int, ans: Int) {
        self.questionInt = quest
        self.question = questionText + String(quest) + String(opt)
        self.answerInt = ans
        self.answer = answerText + String(ans)
    }
    
    func getQuestion() -> String {
        print(question)
        return String(question)
    }
}

struct AnswerLevelOne {
    var answer : String
    var answerInt : Int
    let answerText : String = "answer0"
    
    init(ans: Int) {
        self.answerInt = ans
        self.answer = answerText + String(ans)
    }
    
    func getAnswer() -> String {
        return String(answer)
    }
}

struct TangramGameView: View {
    
    @State private var isShowingPause = false
    @State private var isShowingCongratulation = false
    @State private var isShowingInitialInstructions = true
    @State private var isShowingInstructions = false
    var dismissAction: (() -> Void)
    
    //Lista das pecas que contem o tangram
    var answerLevel: [AnswerLevelOne] = [
        AnswerLevelOne(ans: 1),
        AnswerLevelOne(ans: 2),
        AnswerLevelOne(ans: 3),
        AnswerLevelOne(ans: 4),
    ]
    
    //lista de questoes
    var questionLevel: [QuestionsLevelOne] = [
        QuestionsLevelOne(quest: 0, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 7,  ans: 1),
        QuestionsLevelOne(quest: 0, opt: 8,  ans: 1),
        
        QuestionsLevelOne(quest: 1, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 1, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 1, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 1, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 1, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 1, opt: 6,  ans: 1),
        
        QuestionsLevelOne(quest: 2, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 7,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 8,  ans: 1),
        
        QuestionsLevelOne(quest: 3, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 6,  ans: 1),
        
        QuestionsLevelOne(quest: 4, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 7,  ans: 1),
        
        QuestionsLevelOne(quest: 5, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 7,  ans: 1),
        
        QuestionsLevelOne(quest: 6, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 6, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 6, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 6, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 6, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 6, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 6, opt: 7,  ans: 1),

        QuestionsLevelOne(quest: 7, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 7,  ans: 1),

        QuestionsLevelOne(quest: 8, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 8, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 8, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 8, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 8, opt: 5,  ans: 1),
        
        QuestionsLevelOne(quest: 9, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 3,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 7,  ans: 1),
    ]
    
    //OPCOES DE PECAS A SEREM EXIBIDAS
    @State var objectsOptions: [Int] = [
        1,
        2,
        2,
        2,
    ]
    
    @State var questionSelected : Int = 0
    
    func getNewGame() -> Int {
         return Int.random(in: 0...questionLevel.count-1)
    }
    
    func gerarVetor(n: Int) -> [Int] {
        let oldList = objectsOptions
        
        var vetor = [Int]()
        vetor.append(n)
        while vetor.count < 4 {
            let num = Int.random(in: 0...answerLevel.count-1)
            if num != n && !vetor.contains(num) {
                vetor.append(num)
            }
        }
        
        if oldList != vetor {
            vetor.shuffle()
            vetor.reverse()
        }

        return vetor
    }
    
    func retryGame(){
        questionSelected = getNewGame()
        objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
        //isShowingCongratulation = false
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(questionLevel[questionSelected].getQuestion())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: geometry.size.height * 0.6)
                    .position(CGPoint(x: geometry.size.width * 0.43,y: geometry.size.height * 0.54))
                
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
                    Spacer()
                }
                .padding(.vertical,32)
                .padding(.horizontal,64)


                
                Text("Select the missing part")
                    .font(Font.titleLargeBold)
                    .position(CGPoint(x: geometry.size.width * 0.42, y: geometry.size.height * 0.14))
                VStack {
                    ZStack{
                        Image("backgroundOptions")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.8)
                            .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))
                        VStack{
                            ForEach(0..<(objectsOptions.count)) { i in
                                Image(String(answerLevel[objectsOptions[i]].getAnswer()))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.15)
                                    .onTapGesture {
                                        if (answerLevel[objectsOptions[i]].answerInt == questionLevel[questionSelected].answerInt) {
                                            questionSelected = getNewGame()
                                            
                                            isShowingCongratulation = true
                                            print("CERTO")
                                        } else {
                                            //talvez um sinal sonoro, mas ainda nao decidimos
                                            print("ERRADO")
                                        }
//                                        questionSelected = Int.random(in: 0..<questionLevel.count)
//                                        objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
                                    }
                            }
                        }
                        .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))

                    }
                }

            }
            .onAppear(){
                retryGame()
                //objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
            }
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .popupNavigatopnView(show: $isShowingPause){ PauseModalView(show: $isShowingPause, shuffleGame: retryGame, dismissGame: dismissAction)}
        .popupNavigatopnViewFull(show: $isShowingCongratulation) {
            CompleteModalView(dismissComplete: {isShowingCongratulation = false}, dismissGame: dismissAction, shuffleGame: retryGame)
        }
        .popupNavigatopnView(show: $isShowingInitialInstructions){ TangramInstructionModal(dismissInstruction: {isShowingInitialInstructions = false})}
        .popupNavigatopnView(show: $isShowingInstructions){ TangramInterrogationModal(dismissInstruction: {isShowingInstructions = false})}
    }
}



struct TangramGameView_Previews: PreviewProvider {
    static var previews: some View {
        TangramGameView(dismissAction: {true}).previewInterfaceOrientation(.landscapeLeft)
    }
}
