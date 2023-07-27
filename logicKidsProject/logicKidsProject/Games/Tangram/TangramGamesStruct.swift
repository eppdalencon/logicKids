////
////  TangramGamesStruct.swift
////  logicKidsProject
////
////  Created by Gustavo Diefenbach on 24/07/23.
////
//
//
//// da pra criar um enm para o type se precisar
//struct BlocksInfos {
//    var type: Int
//    var x: Int
//    var y: Int
//    var larg: Int
//    var alt: Int
//}
//
////ESSA CLASSE AGORA ESTA COM EXEMPLOS, MAS ELA DEVE SER CARREGADA QUANDO ABRIR O JOGO
//struct BlockInfosList {
//    // Se você não quer o Singleton, remova a propriedade e o inicializador abaixo
//    private static let blockInfosList = BlockInfosList()
//    
//    // Se quiser usar Singleton, descomente o inicializador abaixo
//    // private init() {
//    //     // Inicialize quaisquer propriedades necessárias aqui.
//    // }
//    
//    // Defina listOfBlocks como uma variável se quiser poder modificá-la
//    var listOfBlocks: [BlocksInfos] = [
//        BlocksInfos(type: 1, x: 2, y: 3, larg: 2, alt: 3),
//        BlocksInfos(type: 1, x: 7, y: 10, larg: 2, alt: 2),
//        BlocksInfos(type: 1, x: 2, y: 16, larg: 3, alt: 1),
//    ]
//    
//    func getSize() -> Int {
//        print(listOfBlocks.count)
//        return listOfBlocks.count
//    }
//}
