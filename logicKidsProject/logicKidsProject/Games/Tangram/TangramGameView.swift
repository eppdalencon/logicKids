//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI


// da pra criar um enm para o type se precisar

enum Formats: String { //(largura X altura) - ?? qualquer inteiro
    case fourSides = "square" //(1x1), (1x2), (2x1) e demais combinacoes (forma qualquer quadrilatero
    case threeSides = "triangle"  //(1x1), (2x2) e multiplos
    case fourSidesAngled = "fourSidesAngled" //(5x3), (10x6) e multiplos
}

enum Rotacao: Int {
    case rotateNone = 0
    case rotateQuarterClockWise = 90
    case rotateQuarterAntiClockWise = -90
    case rotateFlip = 180
}

class BlocksInfos : Identifiable {
    let id: UUID = UUID()
    var type: String
    var x: Int
    var y: Int
    var larg: Int
    var alt: Int
    var rot: Double
    var colorBlock : Color
    
    var width: CGFloat
    var height: CGFloat
    var pointsList: [CGPoint]
    
//    static func create(type: String, x: Int, y: Int, larg: Int, alt: Int) -> BlocksInfos {
//        let widthLet = CGFloat() // Calculate width based on larg
//        let heightLet = CGFloat(alt) // Calculate height based on alt
//        let pointsListLet = [CGPoint(x: 0, y: 0)]
//        return BlocksInfos(type: type, x: x, y: y, larg: larg, alt: alt, width: widthLet, height: heightLet, pointsList: pointsListLet)
//    }
    
    init(type: String, x: Int, y: Int, larg: Int, alt: Int, rot : Int, colorBlock : Color) {
        self.type = type
        self.x = x
        self.y = y
        self.larg = larg
        self.alt = alt
        self.rot = Double(rot)
        self.width = 0
        self.height = 0
        self.colorBlock = colorBlock
        self.pointsList = []
    }
    
    func createSizeAndPoints(sizeGride : CGFloat, initPoint : CGPoint){
        self.width = sizeGride * CGFloat(self.larg)
        self.height = sizeGride * CGFloat(self.alt)
        
        switch self.type {
            case Formats.fourSides.rawValue:
                pointsList = [
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x),          y: initPoint.y + sizeGride * CGFloat(y)), //superior esquerdo
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x) + width,  y: initPoint.y + sizeGride * CGFloat(y)), //superior direito
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x),          y: initPoint.y + sizeGride * CGFloat(y) + height), //inferior esquerdo
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x) + width,  y: initPoint.y + sizeGride * CGFloat(y) + height) //inferior direito
                ]
                print("fourSides: \(pointsList) - (\(width),\(height))")
            case Formats.threeSides.rawValue:
                pointsList = [
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x),          y: initPoint.y + sizeGride * CGFloat(y)), //superior esquerdo
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x),          y: initPoint.y + sizeGride * CGFloat(y) + height), //inferior esquerdo
                    CGPoint(x: initPoint.x + sizeGride * CGFloat(x) + width,  y: initPoint.y + sizeGride * CGFloat(y) + height) //inferior direito
                ]
                print("threeSides: \(pointsList) - (\(width),\(height))")
            case Formats.fourSidesAngled.rawValue:
                print("fourSidesAngled: \(pointsList)")
            default:
                break
        }
    }
}

struct TangramGameView: View {
    static var canvasTangramWidth : CGFloat = 0.63
    static var canvasTangramHeight : CGFloat = 0.64
    
    // MinimumSizeGrid
    //5% da largura do celular na posicao vertical, correspondendo a 80/5 = 16 colunas
    // [1, 2, 4, 5, 10, 20, 25, 50, 100]
    static var gridMinimumSize : Int = 8 //valor que represente % da largura do celular na vertical
    static var verticalLineSpacing: CGFloat = CGFloat(gridMinimumSize)/100 // Valor "%" do valor em px a ser adotado ao quadrado do grid
    @State var numberOfLines : Int = 0 //Esse valor é carregano no .onApper
    @State var numberOfColumns : Int = 0 //Esse valor é carregano no .onApper
    
    
    //VARIAVEIS DO JOGO
    @State var tangramSelect : Int = 1
    @State var missingPiece : BlocksInfos = BlocksInfos(type: "", x: 0, y: 0, larg: 0, alt: 0, rot: 0, colorBlock: Color.clear)
    
    init() {
        self.tangramSelect = 1
        self.randomBlock()
    }
    
    let blockList: [BlocksInfos] = [
        //BlocksInfos(type: Formats.threeSides.rawValue, x: 2, y: 2, larg: 2, alt: 2, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.red),
//
        BlocksInfos(type: Formats.threeSides.rawValue, x: 2, y: 1, larg: 2, alt: 2, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.red),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 2, y: 3, larg: 2, alt: 2, rot: Rotacao.rotateFlip.rawValue, colorBlock: Color.orange),

        BlocksInfos(type: Formats.fourSides.rawValue, x: 4, y: 3, larg: 2, alt: 2, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.yellow),
        BlocksInfos(type: Formats.fourSides.rawValue, x: 6, y: 3, larg: 2, alt: 2, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.green),

        BlocksInfos(type: Formats.threeSides.rawValue, x: 8, y: 3, larg: 1, alt: 1, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.orange),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 8, y: 4, larg: 1, alt: 1, rot: Rotacao.rotateQuarterClockWise.rawValue, colorBlock: Color.orange),

        BlocksInfos(type: Formats.threeSides.rawValue, x: 6, y: 1, larg: 3, alt: 3, rot: Rotacao.rotateFlip.rawValue, colorBlock: Color.red),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 9, y: 1, larg: 3, alt: 3, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.orange),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 9, y: 4, larg: 3, alt: 3, rot: Rotacao.rotateQuarterClockWise.rawValue, colorBlock: Color.pink),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 6, y: 4, larg: 3, alt: 3, rot: Rotacao.rotateQuarterAntiClockWise.rawValue, colorBlock: Color.cyan),

        BlocksInfos(type: Formats.threeSides.rawValue, x: 11, y: 3, larg: 1, alt: 1, rot: Rotacao.rotateFlip.rawValue, colorBlock: Color.cyan),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 11, y: 4, larg: 1, alt: 1, rot: Rotacao.rotateQuarterAntiClockWise.rawValue, colorBlock: Color.yellow),

        BlocksInfos(type: Formats.fourSides.rawValue, x: 12, y: 3, larg: 1, alt: 2, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.orange),

        BlocksInfos(type: Formats.threeSides.rawValue, x: 13, y: 3, larg: 1, alt: 1, rot: Rotacao.rotateNone.rawValue, colorBlock: Color.green),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 13, y: 4, larg: 1, alt: 1, rot: Rotacao.rotateQuarterClockWise.rawValue, colorBlock: Color.cyan),
    ]
    
    var blockOptions: [BlocksInfos] = [
        BlocksInfos(type: Formats.threeSides.rawValue, x: 0, y: 0, larg: 1, alt: 1, rot: Rotacao.rotateQuarterClockWise.rawValue, colorBlock: Color.cyan),
    ]
    
    func randomBlock() {
        self.missingPiece = self.blockList.randomElement() ?? BlocksInfos(type: "", x: 0, y: 0, larg: 0, alt: 0, rot: 0, colorBlock: Color.clear)
    }
    
    func positionX(nodo : Int, width : CGFloat, height : CGFloat) -> CGFloat {
        
        let nodoColumn : Int = Int(nodo % 16)
        let moveX : CGFloat = CGFloat(nodoColumn) * height * TangramGameView.verticalLineSpacing
        let achor : CGFloat = height * TangramGameView.verticalLineSpacing/2
        let borders : CGFloat = width * 0.5 * (1-TangramGameView.canvasTangramWidth)
        
        return (moveX + achor + borders)
    }
 
    func positionY(nodo : Int, width : CGFloat, height : CGFloat) -> CGFloat {
        
        let nodoLine : Int = Int(nodo % 8)
        let moveY : CGFloat = CGFloat(nodoLine) * height * TangramGameView.verticalLineSpacing
        let achor : CGFloat = height * TangramGameView.verticalLineSpacing/2
        let borders : CGFloat = height * 0.5 * (1-TangramGameView.canvasTangramHeight)
        
        return (moveY + achor + borders)
    }
    
    func anchorChangeX(width: Int, sizeBlock: CGFloat) -> CGFloat {

        return( CGFloat(width-1) * sizeBlock/2)
    }
    
    func anchorChangeY(height : Int, sizeBlock : CGFloat) -> CGFloat {
        
        return( CGFloat(height-1) * sizeBlock/2)
    }
    
    func completeAreaData(sizeGride : CGFloat, initPoint : CGPoint){
        print("\(sizeGride) \(initPoint)")
//        ForEach(0..<blockList.count, id: \.self) { index in
//            blockList[index].createSizeAndPoints(sizeGride: sizeGride, initPoint: initPoint)
//        }
        
        for block in blockList {
            block.createSizeAndPoints(sizeGride: sizeGride, initPoint: initPoint)
        }
    }

    @ViewBuilder
    func renderBlockView(blockList: BlocksInfos, index : Int , geometry: GeometryProxy) -> some View {
        
        
        
        if (blockList.type == Formats.fourSides.rawValue) {
            Rectangle()
                .foregroundColor(blockList.id == missingPiece.id ? Color.gray : blockList.colorBlock)
                .frame(width: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList.larg),
                       height: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList.alt))
                .rotationEffect(Angle(degrees: blockList.rot))
                .position(x: anchorChangeX(width: blockList.larg, sizeBlock: geometry.size.height * TangramGameView.verticalLineSpacing) + positionX(nodo: blockList.x, width: geometry.size.width, height: geometry.size.height),
                          y: anchorChangeY(height: blockList.alt, sizeBlock: geometry.size.height * TangramGameView.verticalLineSpacing) + positionY(nodo: blockList.y, width: geometry.size.width, height: geometry.size.height))
                .onTapGesture { point in
                    //print(CGPoint.isInsidePolygon(blocksTamgran: BlockLists, testPoint: point))
                    //print("clicou na peca")
                }
        } else if (blockList.type == Formats.threeSides.rawValue) {
            TriangleView(width: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList.larg),
                                height: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList.alt))
            .foregroundColor(blockList.id == missingPiece.id ? Color.gray : blockList.colorBlock)
                .frame(width: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList.larg),
                       height: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList.alt))
                .rotationEffect(Angle(degrees: blockList.rot))
                .position(x: anchorChangeX(width: blockList.larg, sizeBlock: geometry.size.height * TangramGameView.verticalLineSpacing) + positionX(nodo: blockList.x, width: geometry.size.width, height: geometry.size.height),
                          y: anchorChangeY(height: blockList.alt, sizeBlock: geometry.size.height * TangramGameView.verticalLineSpacing) + positionY(nodo: blockList.y, width: geometry.size.width, height: geometry.size.height))
                .onTapGesture { point in
                    randomBlock()
                    print("MissingPiece: \(self.missingPiece.id), \(blockList.id)")

                    //print(CGPoint.isInsidePolygon(blocksTamgran: blockList, testPoint: point))
                    //print("clicou na peca")
                }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    //.foregroundColor(.green)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                ZStack{
                        Rectangle()
                            .frame(width: geometry.size.width * TangramGameView.canvasTangramWidth,
                                   height: geometry.size.height * TangramGameView.canvasTangramHeight)
                            .foregroundColor(.blue)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
                    ForEach( Array(blockList.enumerated()), id: \.element.id) { (index, block) in
                        //GSTV
                        //print("MissingPiece: \(self.missingPiece.id), \(block.id)")
                        //print("\n\n")x
                        renderBlockView(blockList: blockList[index], index: index, geometry: geometry)
                    }
                    //                        ForEach(0..<blockList.count, id: \.self) { index in
//                            renderBlockView(blockList: blockList[index], index: index, geometry: geometry)
//                        }
//GRID SE PRECISAR
//                        ForEach(0..<numberOfColumns, id: \.self) { index in
//                            Rectangle()
//                                .frame(width: 2, height: geometry.size.height) // Largura e altura da linha vertical
//                                .foregroundColor(.black) // Cor da linha
//                                .position(x: (geometry.size.width * 0.5 * (1-TangramGameView.canvasTangramWidth)) + CGFloat(index) * (geometry.size.height * TangramGameView.verticalLineSpacing),
//                                          y: geometry.size.height / 2)
//                        }
//                        ForEach(0..<numberOfLines, id: \.self) { index in
//                            Rectangle()
//                                .frame(width: geometry.size.width, height: 2) // Largura e altura da linha horizontal
//                                .foregroundColor(.black) // Cor da linha
//                                .position(x: geometry.size.width / 2,
//                                          y: (geometry.size.height * 0.5 * (1-TangramGameView.canvasTangramHeight)) + CGFloat(index) * (geometry.size.height * TangramGameView.verticalLineSpacing))
//                        }
                    }
                    .position(CGPoint(x: geometry.size.width/2, y: geometry.size.height * 0.35))
                    .onAppear{
                        let size : CGFloat = geometry.size.height * TangramGameView.verticalLineSpacing
                        
                        numberOfLines =  Int((geometry.size.height * TangramGameView.canvasTangramHeight)/size) + 1
                        numberOfColumns = Int((geometry.size.width * TangramGameView.canvasTangramWidth)/size) + 1
                        
                        completeAreaData(sizeGride: geometry.size.height * TangramGameView.verticalLineSpacing,
                                         initPoint: CGPoint(x: geometry.size.width * (1-TangramGameView.canvasTangramWidth)/2,
                                                            y: geometry.size.height * (1-TangramGameView.canvasTangramHeight)/2))
                        
                        randomBlock()
                        print("MissingPiece: \(self.missingPiece)")
                    }
                    Rectangle()
                        .foregroundColor(Color.white)
                        .frame(width: geometry.size.width * 0.80, height: geometry.size.height * 0.25)
                        .position(CGPoint(x: geometry.size.width/2, y: geometry.size.height * 0.83))

                }
            //.edgesIgnoringSafeArea(.all)
        }
    }
}

struct TangramGameView_Previews: PreviewProvider {
    static var previews: some View {
        TangramGameView()
    }
}
