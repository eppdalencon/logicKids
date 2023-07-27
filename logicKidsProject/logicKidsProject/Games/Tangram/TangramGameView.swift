//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI

struct TamgranInfos {
    var id : Int
    var numberOfPieces : Int
    var listTamgram : [String]?
    
    init(id: Int, numberOfPieces: Int) {
        self.id = id
        self.numberOfPieces = numberOfPieces
        for i in 0..<numberOfPieces {
            self.listTamgram?.append(String(format: "%02d", i))
        }
      }
    
    func getTangram(x: Int) -> String {
        let tamgramTyoe : String = String(format: "%02d", id)
        let missingpart : String = String(format: "%02d", x)
        return String(tamgramTyoe + missingpart)
    }
}

struct TangramGameView: View {
    
    //INFORMADO MANUALMENTE
    var tangramList: [TamgranInfos] = [
        TamgranInfos(id: 1, numberOfPieces: 3),
        TamgranInfos(id: 1, numberOfPieces: 3),
        TamgranInfos(id: 1, numberOfPieces: 3)
    ]
    
    //NUMERO DE TIPOS DE PECAS QUE TEMOS CRIADAS
    let objectsList: [String] = [
        "1",
        "2",
        "3",
        "4",
        "5"
    ]
    
    //OPCOES DE PECAS A SEREM EXIBIDAS
    @State var objectsOptions: [Int] = [
        2,
        3,
        1,
    ]
        

    //FUNCAO QUE GERA OS TRES NUMEROS ANTERIORES
    //precisa ainda fazer ela conter a resposta para o tamgram, e ter a resposta na estrutura do tamgram
    func getNewOptions(maxNumero: Int) -> [Int] {
        var objetosOptions: [Int] = [0, 0, 0]
        
        for i in 0..<objetosOptions.count {
            let novoNumero = Int.random(in: 1...maxNumero)
            objetosOptions[i] = novoNumero
        }
        
        return objetosOptions
    }
    
    @State var tangramSelected : Int = 0
    @State var tangramMissingPiece : Int = 0 //numero do tipo do bloco que esta faltando (vai estar na estrutura
    

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
                Image(tangramList[0].getTangram(x:tangramMissingPiece))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.45)
                    .position(CGPoint(x: geometry.size.width * 0.37,y: geometry.size.height * 0.60))
                Image("buttomPause")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.09)
                    .position(CGPoint(x: geometry.size.width * 0.1, y: geometry.size.height * 0.15))
                Text("Select the missing part")
                    .font(Font.titleBold)
                    .position(CGPoint(x: geometry.size.width * 0.45, y: geometry.size.height * 0.15))
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
                                Image(String(objectsOptions[i]))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.width * 0.10)
                                    .onTapGesture {
                                        print(i)
                                        tangramSelected = Int.random(in: 0..<tangramList.count)
                                        self.objectsOptions = getNewOptions(maxNumero: tangramList[tangramSelected].numberOfPieces)
                                        tangramMissingPiece = Int.random(in: 0..<tangramList[tangramSelected].numberOfPieces)
                                    }
                            }
                            Spacer()
                        }
                        .position(CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.5))

                    }
                }

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
