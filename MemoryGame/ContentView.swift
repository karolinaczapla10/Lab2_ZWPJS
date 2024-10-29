//
//  ContentView.swift
//  MemoryGame
//
//  Created by Karolina on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    var tab = ["😂", "😝", "🤩", "🤨"]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(0..<tab.count, id: \.self) { i in
                        CardView(content: tab[i])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}


