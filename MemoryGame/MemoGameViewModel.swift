//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by Karolina on 05/11/2024.
//

import Foundation
import SwiftUI

class MemoGameViewModel: ObservableObject {
    @Published var cards: [MemoGameModel<String>.Card] = []
    @Published var themeColor: Color = .blue

    private let themes: [Int: ([String], Color)] = [
        1: (["😂", "😝", "🤩", "🤨", "🙃", "😇", "🤓", "😚"], .blue),
        2: (["🍎", "🍈", "🍋", "🫛", "🍳", "🍏", "🍋"], .green),
        3: (["🥲", "🏀", "🥎", "🎾", "🏉", "🏐", "🏑", "🛝"], .red)
    ]

    init() {
        changeTheme(to: 1)
    }

    func changeTheme(to themeNumber: Int) {
        if let theme = themes[themeNumber] {
            cards = theme.0.shuffled().map { content in
                MemoGameModel<String>.Card(content: content, id: UUID().uuidString)
            }
            themeColor = theme.1
        }
    }

    func shuffleCards() {
        cards.shuffle()
    }
}

