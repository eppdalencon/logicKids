//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct QuestionsLevelOne {
    var question : String
    var answer : String
    var answerInt : Int

    
    let questionText : String = "question-0-"
    
    init(quest: Int, ans: Int) {
        self.question = questionText + String(quest)
        self.answerInt = ans
        self.answer = questionText + String(ans)
    }
    
    func getQuestion() -> String {
        return String(question)
    }
}

struct AnswerLevelOne {
    var answer : String
    var answerInt : Int
    let answerText : String = "answer-0-"
    
    init(ans: Int) {
        self.answerInt = ans
        self.answer = answerText + String(ans)
    }
    
    func getAnswer() -> String {
        return String(answer)
    }
}

struct TangramGameView: View {
    
    //Lista das pecas que contem o tangram
    var answerLevel: [AnswerLevelOne] = [
        AnswerLevelOne(ans: 0),
        AnswerLevelOne(ans: 1),
        AnswerLevelOne(ans: 2),
        AnswerLevelOne(ans: 3),
        AnswerLevelOne(ans: 4),
        AnswerLevelOne(ans: 5),
        AnswerLevelOne(ans: 6)
    ]
    
    //lista de questoes
    var questionLevel: [QuestionsLevelOne] = [
        QuestionsLevelOne(quest: 0, ans: 1),
        QuestionsLevelOne(quest: 1, ans: 2),
        QuestionsLevelOne(quest: 2, ans: 3)
    ]
    
    //OPCOES DE PECAS A SEREM EXIBIDAS
    @State var objectsOptions: [Int] = [
        1,
        3,
        4,
    ]
    
    @State var questionSelected : Int = 0
    
    
    func gerarVetor(n: Int) -> [Int] {
        let oldList = objectsOptions //a l
        
        var vetor = [Int]()
        vetor.append(n)
        while vetor.count < 3 {
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

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    //.aspectRatio(geometry.size ,contentMode: .fill)
                    .aspectRatio(contentMode: .fit)
                    //.frame(maxWidth: .infinity, maxHeight: .infinity)
                    //.scaledToFit()
                    //.frame(height: geometry.size.height)
                Image(questionLevel[questionSelected].getQuestion())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.45)
                    .position(CGPoint(x: geometry.size.width * 0.37,y: geometry.size.height * 0.56))
                Image("buttomPause")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.09)
                    .position(CGPoint(x: geometry.size.width * 0.1, y: geometry.size.height * 0.15))
                Text("Select the missing part")
                    .font(Font.titleBold)
                    .position(CGPoint(x: geometry.size.width * 0.42, y: geometry.size.height * 0.15))
                VStack {
                    ZStack{
                        Image("backgroundOptions")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.8)
                            .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))
                        VStack{
                            Spacer()
                            ForEach(0..<(objectsOptions.count)) { i in
                                Image(String(answerLevel[objectsOptions[i]].getAnswer()))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.width * 0.10)
                                    .onTapGesture {
//                                        print("numero da peca clicada: \(answerLevel[objectsOptions[i]].answerInt)")
//                                        print("questao resposta: \(questionLevel[questionSelected].answerInt)")
//                                        print("pecas possiveis\(objectsOptions)")
                                        if (answerLevel[objectsOptions[i]].answerInt == questionLevel[questionSelected].answerInt) {
                                            print("CERTO")
                                        } else {
                                            print("ERRADO")
                                        }
                                        questionSelected = Int.random(in: 0..<questionLevel.count)
                                        objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
                                    }
                            }
                            Spacer()
                        }
                        .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))

                    }
                }

            }
            .onAppear(){
                objectsOptions = gerarVetor(n:questionLevel[questionSelected].answerInt)
            }
        }
        .ignoresSafeArea(.all)

    }
}



struct TangramGameView_Previews: PreviewProvider {
    static var previews: some View {
        TangramGameView().previewInterfaceOrientation(.landscapeLeft)
    }
}
