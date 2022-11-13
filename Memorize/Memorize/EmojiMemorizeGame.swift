//
//  EmojiMEmorizeGame.swift
//  Memorize
//
//  Created by x2mobile on 13.11.2022.
//

import Foundation

class EmojiMemorizeGame: ObservableObject {
    
    // MARK: - Static vars
    static let emojis: [String] = ["🏀", "🏈", "🥎", "🏐", "⚽️", "🎱"]
//    static let emojis: [String] = []
    // MARK: - Properties
    @Published private var model: MemorizeGame<String> = createMemoryGame()
    
    // MARK: - Computed Properties
    var cards: Array<MemorizeGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Static functions
    static func createMemoryGame() -> MemorizeGame<String> {
        MemorizeGame(numberOfPairsOfCards: 4) {
            index in emojis[index]
        }
    }
    
    // MARK: - Intents
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
    
}
