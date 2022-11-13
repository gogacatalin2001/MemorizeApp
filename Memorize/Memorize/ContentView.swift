//
//  ContentView.swift
//  Memorize
//
//  Created by x2mobile on 12.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemorizeGame
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], spacing: 10) {
                ForEach (viewModel.cards) {
                    card in CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.3)) {
                                viewModel.choose(card)
                            }
                        }
                }
            }
        }
        .padding([.top, .horizontal])
    }
    
    struct CardView: View {
        
        let card: MemorizeGame<String>.Card
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                let symbol = Text(card.content).font(.largeTitle)
                if card.isFaceUp {
                    shape
                        .foregroundColor(.gray)
                    symbol
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    symbol
                    shape
                        .foregroundColor(.red)
                }
            }
            .rotation3DEffect(Angle.degrees(card.isFaceUp ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let game = EmojiMemorizeGame()
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
