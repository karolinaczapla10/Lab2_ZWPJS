//
//  ContentView.swift
//  MemoryGame
//
//  Created by Karolina on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var themeNumber = 1
    @State private var themeColor = Color.blue
    @State private var tab: [String] = ["😂", "😝", "🤩", "🤨", "🙃", "😇", "🤓", "😚"]

    let tab1 = ["😂", "😝", "🤩", "🤨", "🙃", "😇", "🤓", "😚"]
    let tab2 = ["🍎", "🍈", "🍋", "🫛", "🍳", "🍏", "🍋"]
    let tab3 = ["🥲", "🏀", "🥎", "🎾", "🏉", "🏐", "🏑", "🛝"]

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Wyświetlanie kart
            cardDisplay
            
            Spacer()
            
            // Przycisk zmiany motywu
            HStack {
                Button(action: { updateTheme(to: 1) }) {
                    VStack {
                        Image(systemName: "face.smiling")
                        Text("Faces")
                    }
                    .padding()
                }
                .background(Color.blue)
                .cornerRadius(8)
                
                Button(action: { updateTheme(to: 2) }) {
                    VStack {
                        Image(systemName: "leaf")
                        Text("Fruits")
                    }
                    .padding()
                }
                .background(Color.green)
                .cornerRadius(8)
                
                Button(action: { updateTheme(to: 3) }) {
                    VStack {
                        Image(systemName: "sportscourt")
                        Text("Sports")
                    }
                    .padding()
                }
                .background(Color.red)
                .cornerRadius(8)
            }
            .padding()
        }
        .onAppear {
            updateTheme(to: themeNumber)
        }
    }
    
    private var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(0..<min(tab.count, 8), id: \.self) { i in
                    CardView(content: tab[i])
                        .aspectRatio(2/3, contentMode: .fit)
                        .foregroundColor(themeColor)
                }
            }
            .padding()
        }
    }

    // Funkcja aktualizacji motywu
    private func updateTheme(to number: Int) {
        themeNumber = number
        switch number {
        case 1:
            tab = tab1.shuffled()
            themeColor = .blue
        case 2:
            tab = tab2.shuffled()
            themeColor = .green
        case 3:
            tab = tab3.shuffled()
            themeColor = .red
        default:
            break
        }
    }
}

#Preview {
    ContentView()
}
