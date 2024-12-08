//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by Karolina on 05/11/2024.
//

import Foundation
import SwiftUI

class MemoGameViewModel: ObservableObject {
    @Published var cards: [MemoGameModel<String>.Card] = [] //Dane te pochodzą z modelu (MemoGameModel) i są publikowane, aby widok automatycznie reagował na zmiany
    @Published var themeColor: Color = .blue
    @Published var mainCard: MemoGameModel<String>.Card?

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
                let numberOfCards = theme.0.count
                let model = MemoGameModel<String>(
                    numberOfCards: numberOfCards,
                    cardContentFactory: { index in self.cardContent(for: index, in: theme.0) }
                )
                cards = model.cards
                mainCard = model.mainCard // Ustaw główną kartę
                themeColor = theme.1
            }
        }

    func shuffleCards() {
        cards.shuffle()
    }
    
    private func cardContent(for index: Int, in symbols: [String]) -> String {
        if index >= 0 && index < symbols.count {
            return symbols[index]
        } else {
            return "??" // Symbol błędu
        }
    }

    
}

