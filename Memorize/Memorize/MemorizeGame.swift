//
//  MemorizeGame.swift
//  Memorize
//
//  Created by x2mobile on 13.11.2022.
//

import Foundation


struct MemorizeGame<CardContent> where CardContent: Equatable{
    private (set) var cards: Array<Card>
    private var indexOfCardFacingUp: Int?
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex { $0.id == card.id },
            !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isFaceUp {
            // one card is facing up
            if let potentialMatchIndex = indexOfCardFacingUp {
                // if a match is found set both cards facing up
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfCardFacingUp = nil
            } else {
                // when the first card or the third card is facing up
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfCardFacingUp = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    } 		
}
