//
//  CardView.swift
//  MemoryGame
//
//  Created by Karolina on 22/10/2024.
//

import SwiftUI

struct CardView: View {
    var number: String
    @State private var odworcona: Bool = true

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(odworcona ? Color.white : Color.blue)
                .overlay(RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(lineWidth: 10))
            
            Text("😍")
                .font(.largeTitle)
                .foregroundColor(.black)
                .opacity(odworcona ? 1 : 0)
        }
        .onTapGesture {
            odworcona.toggle()
        }
        .frame(width: 150, height: 200)
    }
}

#Preview {
    CardView(number: "1")
}
