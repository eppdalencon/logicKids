//
//  HapticFeedbackManager.swift
//  Tans
//
//  Created by Gustavo Diefenbach on 14/09/23.
//

import SwiftUI

class HapticFeedbackManager {
    static let shared = HapticFeedbackManager() // Criando uma instância compartilhada

    private let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .rigid)

    private init() {} // Tornando o inicializador privado para garantir uma única instância

    func hapticFeedback() {
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
}

