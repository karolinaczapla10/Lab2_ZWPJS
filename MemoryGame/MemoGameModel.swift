//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by Karolina on 05/11/2024.
//

import Foundation


struct MemoGameModel<CardContent> where CardContent :Equatable{
    private(set) var cards: Array<Card>
    private(set) var mainCard: Card? = nil
    
    init(numberOfCards: Int, cardContentFactory:(Int) -> CardContent){
        cards = []
        let mainCardNumber = Int.random(in: 0..<numberOfCards)
        for index in 0..<numberOfCards{
            let content: CardContent = cardContentFactory(index)
            cards.append(Card(content: content, id: "\(index)n"))
            if mainCardNumber == index {
                self.mainCard = Card(content: content, id: "\(index)n")
            }
        }
    }
    
    func choose(_ card:Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }

    struct Card : Equatable, Identifiable {
        var isFaceUp = true
        var isMached = true
        let content : CardContent
        var id : String
    }
    
}
