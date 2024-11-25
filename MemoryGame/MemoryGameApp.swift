//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Karolina on 22/10/2024.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = MemoGameViewModel() // Use StateObject for ViewModel

    var body: some Scene {
        WindowGroup {
            ContentView(viewmodel: game) // Pass ViewModel to ContentView
        }
    }
}
