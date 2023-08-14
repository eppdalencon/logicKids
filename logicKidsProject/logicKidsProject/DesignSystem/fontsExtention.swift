//
//  fontsExtention.swift
//  logicKidsProject
//
//  Created by Gustavo Diefenbach on 27/07/23.
//

import Foundation
import SwiftUI

public extension Font {
    
    static let titleLarge = Font.system(.largeTitle, design: .rounded, weight: .regular)
    static let titleLargeBold = titleLarge.bold()
    
    static let titleMiddle = Font.system(.body, design: .rounded, weight: .regular)
    static let titleMiddleBold = titleMiddle.bold()
    
    static let titleNormal = Font.system(.title3, design: .rounded, weight: .regular)
    static let titleNormalBold = titleNormal.bold()
    
    static let titleNormal1 = Font.system(.title, design: .rounded, weight: .regular)
    static let titleNormalBold1 = titleNormal1.bold()
    
}
