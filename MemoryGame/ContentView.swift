//
//  ContentView.swift
//  MemoryGame
//
//  Created by Karolina on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewmodel: MemoGameViewModel

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(viewmodel.themeColor)

            if let mainCard = viewmodel.mainCard {
                            CardView(card: mainCard)
                                .frame(maxWidth: 150, maxHeight: 150)
                                .foregroundColor(viewmodel.themeColor)
                                .padding(.bottom, 20) // Dystans od siatki kart
                        }
            cardDisplay
            
            Spacer()
            
            HStack {
                Button(action: { viewmodel.changeTheme(to: 1) }) {
                    VStack {
                        Image(systemName: "face.smiling")
                        Text("Faces")
                    }
                }
                .padding()
                
                Button(action: { viewmodel.changeTheme(to: 2) }) {
                    VStack {
                        Image(systemName: "leaf")
                        Text("Fruits")
                    }
                }
                .padding()
                
                Button(action: { viewmodel.changeTheme(to: 3) }) {
                    VStack {
                        Image(systemName: "sportscourt")
                        Text("Sports")
                    }
                }
                .padding()
            }
            
            Button(action: { viewmodel.shuffleCards() }) {
                Text("Shuffle Cards")
                    .padding()
                    .background(viewmodel.themeColor.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding()
        }
    }

    private var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
                ForEach(viewmodel.cards) { card in
                    CardView(card: card)
                        .padding(5)
                        .foregroundColor(viewmodel.themeColor)
                }
            }
        }
    }
}

#Preview {
    ContentView(viewmodel: MemoGameViewModel())
}

