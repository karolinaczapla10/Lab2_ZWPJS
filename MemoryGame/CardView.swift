//
//  CardView.swift
//  MemoryGame
//
//  Created by Karolina on 22/10/2024.
//

import SwiftUI

struct CardView: View {
    @State var isFaceUp = true
    var card: MemoGameModel<String>.Card

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .padding(10)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    CardView(card: MemoGameModel<String>.Card(content: "👻", id: "1"))
}

