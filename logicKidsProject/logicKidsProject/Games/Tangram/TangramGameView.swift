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
        self.answer = answerText + String(quest) + String(ans)
    }
    
    func getQuestion() -> String {
        return String(question)
    }
    
    func getAnswer() -> String {
        return String(answer)
    }
}

//struct AnswerLevelOne {
//    var answer : String
//    var answerInt : Int
//    let answerText : String = "answer0"
//
//    init(ans: Int) {
//        self.answerInt = ans
//        self.answer = answerText + String(ans)
//    }
//
//    func getAnswer() -> String {
//        return String(answer)
//    }
//}

struct TangramGameView: View {
    
    @State private var isShowingPause = false
    @State private var isShowingCongratulation = false
    @State private var isShowingInitialInstructions = true
    @State private var isShowingInstructions = false
    var dismissAction: (() -> Void)
    
    //Lista das pecas que contem o tangram
//    var answerLevel: [AnswerLevelOne] = [
//        AnswerLevelOne(ans: 1),
//        AnswerLevelOne(ans: 2),
//        AnswerLevelOne(ans: 3),
//        AnswerLevelOne(ans: 4),
//    ]
    var numberOfTansForQuest: [Int] = [ 7, 5, 6, 4, 6, 5, 7, 6, 4, 7]
    
    @State private var selectedImageIndex: Int? = nil
    
    //lista de questoes
    var questionLevel: [QuestionsLevelOne] = [
        QuestionsLevelOne(quest: 0, opt: 1,  ans: 6),
        QuestionsLevelOne(quest: 0, opt: 2,  ans: 5),
        QuestionsLevelOne(quest: 0, opt: 3,  ans: 7),
        QuestionsLevelOne(quest: 0, opt: 4,  ans: 6),
        QuestionsLevelOne(quest: 0, opt: 5,  ans: 4),
        QuestionsLevelOne(quest: 0, opt: 6,  ans: 3),
        QuestionsLevelOne(quest: 0, opt: 7,  ans: 2),
        QuestionsLevelOne(quest: 0, opt: 8,  ans: 1),
        
        QuestionsLevelOne(quest: 1, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 1, opt: 2,  ans: 5),
        QuestionsLevelOne(quest: 1, opt: 3,  ans: 2),
        QuestionsLevelOne(quest: 1, opt: 4,  ans: 4),
        QuestionsLevelOne(quest: 1, opt: 5,  ans: 2),
        QuestionsLevelOne(quest: 1, opt: 6,  ans: 3),
        
        QuestionsLevelOne(quest: 2, opt: 1,  ans: 4),
        QuestionsLevelOne(quest: 2, opt: 2,  ans: 6),
        QuestionsLevelOne(quest: 2, opt: 3,  ans: 5),
        QuestionsLevelOne(quest: 2, opt: 4,  ans: 3),
        QuestionsLevelOne(quest: 2, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 2, opt: 6,  ans: 2),
        QuestionsLevelOne(quest: 2, opt: 7,  ans: 2),
        QuestionsLevelOne(quest: 2, opt: 8,  ans: 2),

        QuestionsLevelOne(quest: 3, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 2,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 3,  ans: 2),
        QuestionsLevelOne(quest: 3, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 3, opt: 5,  ans: 4),
        QuestionsLevelOne(quest: 3, opt: 6,  ans: 3),

        QuestionsLevelOne(quest: 4, opt: 1,  ans: 5),
        QuestionsLevelOne(quest: 4, opt: 2,  ans: 4),
        QuestionsLevelOne(quest: 4, opt: 3,  ans: 6),
        QuestionsLevelOne(quest: 4, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 5,  ans: 1),
        QuestionsLevelOne(quest: 4, opt: 6,  ans: 2),
        QuestionsLevelOne(quest: 4, opt: 7,  ans: 3),

        QuestionsLevelOne(quest: 5, opt: 1,  ans: 2),
        QuestionsLevelOne(quest: 5, opt: 2,  ans: 4),
        QuestionsLevelOne(quest: 5, opt: 3,  ans: 5),
        QuestionsLevelOne(quest: 5, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 5,  ans: 3),
        QuestionsLevelOne(quest: 5, opt: 6,  ans: 1),
        QuestionsLevelOne(quest: 5, opt: 7,  ans: 5),

        QuestionsLevelOne(quest: 6, opt: 1,  ans: 7),
        QuestionsLevelOne(quest: 6, opt: 2,  ans: 6),
        QuestionsLevelOne(quest: 6, opt: 3,  ans: 5),
        QuestionsLevelOne(quest: 6, opt: 4,  ans: 2),
        QuestionsLevelOne(quest: 6, opt: 5,  ans: 4),
        QuestionsLevelOne(quest: 6, opt: 6,  ans: 3),
        QuestionsLevelOne(quest: 6, opt: 7,  ans: 1),

        QuestionsLevelOne(quest: 7, opt: 1,  ans: 1),
        QuestionsLevelOne(quest: 7, opt: 2,  ans: 2),
        QuestionsLevelOne(quest: 7, opt: 3,  ans: 6),
        QuestionsLevelOne(quest: 7, opt: 4,  ans: 5),
        QuestionsLevelOne(quest: 7, opt: 5,  ans: 6),
        QuestionsLevelOne(quest: 7, opt: 6,  ans: 4),
        QuestionsLevelOne(quest: 7, opt: 7,  ans: 3),

        QuestionsLevelOne(quest: 8, opt: 1,  ans: 3),
        QuestionsLevelOne(quest: 8, opt: 2,  ans: 4),
        QuestionsLevelOne(quest: 8, opt: 3,  ans: 5),
        QuestionsLevelOne(quest: 8, opt: 4,  ans: 2),
        QuestionsLevelOne(quest: 8, opt: 5,  ans: 1),

        QuestionsLevelOne(quest: 9, opt: 1,  ans: 2),
        QuestionsLevelOne(quest: 9, opt: 2,  ans: 4),
        QuestionsLevelOne(quest: 9, opt: 3,  ans: 5),
        QuestionsLevelOne(quest: 9, opt: 4,  ans: 1),
        QuestionsLevelOne(quest: 9, opt: 5,  ans: 6),
        QuestionsLevelOne(quest: 9, opt: 6,  ans: 3),
        QuestionsLevelOne(quest: 9, opt: 7,  ans: 7)
    ]
    
    //OPCOES DE PECAS A SEREM EXIBIDAS
    @State var objectsOptions: [Int] = [
        1,
        1,
        1,
        1,
    ]
    
    @State var questionSelected : Int = 0
    
    func getNewGame() -> Int { //tirar os gets e sets
        let randomInt: Int = Int.random(in: 0...questionLevel.count-1)
        print("novo jogo game\(randomInt)")
        return randomInt
    }
    
    func gerarVetor(n: Int) -> [Int] {
        let oldList = objectsOptions
        
        var vetor = [Int]()
        vetor.append(n)
        while vetor.count < 4 {
            let num = Int.random(in: 1...numberOfTansForQuest[questionLevel[questionSelected].questionInt])
            if num != n && !vetor.contains(num) {
                vetor.append(num)
                print(num)
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
        print("NEW OPTIONS: \(objectsOptions)")
        //isShowingCongratulation = false
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
//                Image("background_image")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                Image(questionLevel[questionSelected].getQuestion())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: geometry.size.height * 0.73)
                    .position(CGPoint(x: geometry.size.width * 0.45,y: geometry.size.height * 0.54))
            // MARK: - Buttons
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
                .padding(.horizontal,32)


                // MARK: - Game

                Text(String(localized: "GameOneTitle"))
                    .font(Font.titleNormalBold1)
                    .position(CGPoint(x: geometry.size.width * 0.45, y: geometry.size.height * 0.14))
                VStack {
                    ZStack{
                        Image("backgroundOptions")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.9)
                            .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))
                        VStack{
                            ForEach(0..<(objectsOptions.count)) { i in
                                Image("answer\(questionLevel[questionSelected].questionInt)\(objectsOptions[i])")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.17)
                                    .saturation(selectedImageIndex == i ? 0.0 : 1.0)
                                    .onTapGesture {
                                        if ((questionLevel[questionSelected].answerInt) == (objectsOptions[i])) {
                                            isShowingCongratulation = true
                                            //print("CERTO")
                                        } else {
                                            //print("ERRADO")
                                            selectedImageIndex = i // Store the selected image index
                                                        
                                            // Delay the color change for 2 seconds using DispatchQueue
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                selectedImageIndex = nil // Reset the selected image index after 2 seconds
                                            }
                                            
                                        }
                                        
                                        
                                    }
                            }
                        }
                        .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))
                    }
                }
                .offset(CGSize(width: 64, height: 0))

            }
            .onAppear(){
                retryGame()
                //objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
            }
        }
        .ignoresSafeArea(.all)
        .background(Color("backgroundColor"))
        .navigationBarBackButtonHidden(true)
        .popupNavigatopnView(show: $isShowingPause){ PauseModalView(show: $isShowingPause, shuffleGame: retryGame, dismissGame: dismissAction)}
        .popupNavigatopnViewFull(show: $isShowingCongratulation) {
            CompleteModalView(dismissComplete: {isShowingCongratulation = false}, dismissGame: dismissAction, shuffleGame: retryGame,gameName: questionLevel[questionSelected].questionInt)
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
