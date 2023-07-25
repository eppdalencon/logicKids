//
//  TangramGameView.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 24/07/23.
//

import SwiftUI


// da pra criar um enm para o type se precisar

enum Formats: String { //(largura X altura) - ?? qualquer inteiro
    case fourSides = "square" //(?x?)
    case threeSides = "triangle"  //(1x1) e multíplos
    case fourSidesAngled = "fourSidesAngled" //(5x3)
}


struct BlocksInfos {
    var type: String
    var x: Int
    var y: Int
    var larg: Int
    var alt: Int
}


struct TangramGameView: View {
    static var canvasTangramWidth :    CGFloat = 0.80
    static var canvasTangramHeight : CGFloat = 0.785
    
    
    // MinimumSizeGrid
    //5% da largura do celular na posicao vertical, correspondendo a 80/5 = 16 colunas
    // [1, 2, 4, 5, 10, 20, 25, 50, 100]
    static var gridMinimumSize : Int = 6 //valor que represente % da largura do celular na vertical
    static var verticalLineSpacing: CGFloat = CGFloat(gridMinimumSize)/100 // Valor "px" do quadrado do grid
    @State var numberOfLines : Int = 0 //Esse valor é carregano no .onApper
    @State var numberOfColumns : Int = 0 //Esse valor é carregano no .onApper
    
    
    @State var points:[CGPoint] = [CGPoint(x:0,y:0), CGPoint(x:50,y:50)]

    var blockList: [BlocksInfos] = [
        BlocksInfos(type: Formats.fourSides.rawValue, x: 2, y: 3, larg: 2, alt: 3),
        BlocksInfos(type: Formats.threeSides.rawValue, x: 16, y: 10, larg: 2, alt: 2),
        BlocksInfos(type: Formats.fourSidesAngled.rawValue, x: 5, y: 24, larg: 5, alt: 3),
    ]
    
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

    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                //Color.green
                Rectangle()
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .foregroundColor(.green)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                Rectangle()
                    .frame(width: geometry.size.width * TangramGameView.canvasTangramWidth,
                           height: geometry.size.height * TangramGameView.canvasTangramHeight)
                    .foregroundColor(.blue)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                ForEach(0..<blockList.count, id: \.self) { index in
                    Image(blockList[index].type)
                        .resizable()
                        .frame(width: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList[index].larg),
                               height: geometry.size.height * TangramGameView.verticalLineSpacing * CGFloat(blockList[index].alt))
                        .position(x: anchorChangeX(width: blockList[index].larg,sizeBlock: geometry.size.height * TangramGameView.verticalLineSpacing) + positionX(nodo: blockList[index].x, width: geometry.size.width, height: geometry.size.height),
                                  y: anchorChangeY(height: blockList[index].alt, sizeBlock:geometry.size.height * TangramGameView.verticalLineSpacing) + positionY(nodo: blockList[index].y,width: geometry.size.width, height: geometry.size.height))
                        .onTapGesture {
                            
                        }
                }
                ForEach(0..<numberOfColumns, id: \.self) { index in
                    Rectangle()
                        .frame(width: 2, height: geometry.size.height) // Largura e altura da linha vertical
                        .foregroundColor(.black) // Cor da linha
                        .position(x: (geometry.size.width * 0.5 * (1-TangramGameView.canvasTangramWidth)) + CGFloat(index) * (geometry.size.height * TangramGameView.verticalLineSpacing),
                                  y: geometry.size.height / 2)
                }
                ForEach(0..<numberOfLines, id: \.self) { index in
                    Rectangle()
                        .frame(width: geometry.size.width, height: 2) // Largura e altura da linha horizontal
                        .foregroundColor(.black) // Cor da linha
                        .position(x: geometry.size.width / 2,
                                  y: (geometry.size.height * 0.5 * (1-TangramGameView.canvasTangramHeight)) + CGFloat(index) * (geometry.size.height * TangramGameView.verticalLineSpacing))
                }
            }
            .onAppear{
                let size : CGFloat = geometry.size.height * TangramGameView.verticalLineSpacing
                
                numberOfLines =  Int((geometry.size.height * TangramGameView.canvasTangramHeight)/size) + 1
                numberOfColumns = Int((geometry.size.width * TangramGameView.canvasTangramWidth)/size) + 1
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

