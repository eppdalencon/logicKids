//
//  TangramExtentionCGPoint.swift
//  logicKidsProject
//
//  Created by Gustavo Diefenbach on 25/07/23.
//

import Foundation

extension CGPoint {
    
    static func isPointInsideTriangle(pointsList: [CGPoint], testPoint: CGPoint) -> Bool {
        //print(pointsList.count)
//        print(pointsList[0].x,pointsList[0].y)
//        print(pointsList[1].x,pointsList[1].y)
//        print(pointsList[2].x,pointsList[2].y)
//
        guard pointsList.count == 3 else {
            // A lista precisa conter exatamente 3 pontos para formar um triângulo
            return false
        }
        
        func isInsideTriangle(_ testPoint: CGPoint, _ vertex1: CGPoint, _ vertex2: CGPoint, _ vertex3: CGPoint) -> Bool {
            let sign = (vertex2.x - vertex1.x) * (testPoint.y - vertex1.y) - (vertex2.y - vertex1.y) * (testPoint.x - vertex1.x)
            let sign2 = (vertex3.x - vertex2.x) * (testPoint.y - vertex2.y) - (vertex3.y - vertex2.y) * (testPoint.x - vertex2.x)
            let sign3 = (vertex1.x - vertex3.x) * (testPoint.y - vertex3.y) - (vertex1.y - vertex3.y) * (testPoint.x - vertex3.x)
            
            return (sign >= 0 && sign2 >= 0 && sign3 >= 0) || (sign <= 0 && sign2 <= 0 && sign3 <= 0)
        }
        
        return isInsideTriangle(testPoint, pointsList[0], pointsList[1], pointsList[2])
    }
    
    
    // Função para verificar se um ponto está dentro de um polígono
    static func isInsidePolygon(blocksTamgran: [BlocksInfos], testPoint: CGPoint) -> Bool {
        return isPointInsideTriangle(pointsList : blocksTamgran[0].pointsList,testPoint : testPoint)
        
    }
}
