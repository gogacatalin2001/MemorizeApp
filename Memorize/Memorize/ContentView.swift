//
//  ContentView.swift
//  Memorize
//
//  Created by x2mobile on 12.11.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["🏀", "🏈", "🥎", "🏐", "⚽️", "🎱"]
    @State var cardCount: Int = 4
    var rowCount: Int = 3
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                CardRowView(cardCount: cardCount, emojis: emojis)
                CardRowView(cardCount: cardCount, emojis: emojis)
                CardRowView(cardCount: cardCount, emojis: emojis)
            }
            Spacer()
            HStack() {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if cardCount < emojis.count {
                cardCount = cardCount + 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            if cardCount > 0 {
                cardCount = cardCount - 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    struct CardView: View {
        @State var isFaceUp: Bool = false
        var content: String
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                if isFaceUp {
                    shape
                        .foregroundColor(.gray)
                    Text(content)
                        .font(.largeTitle)
                } else {
                    Text(content)
                        .font(.largeTitle)
                    shape
                        .foregroundColor(.red)
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    struct CardRowView: View {
        var cardCount: Int
        var emojis: [String]
        var body: some View {
            HStack {
                ForEach (emojis[0..<cardCount], id: \.self) {
                    emoji in CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
