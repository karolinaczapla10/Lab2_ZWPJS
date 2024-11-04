//
//  ButtonView.swift
//  MemoryGame
//
//  Created by Karolina on 29/10/2024.
//

import SwiftUI

struct ButtonView: View {
    var imageName = ""
    var text = ""
    var ownNumber = 0
    var ownColor = Color.blue
    @Binding var themeColor : Color
    @Binding var themeNumber : Int
    
    var body: some View {
        Button(action:{
            themeNumber = ownNumber
            themeColor = ownColor
        }, label: {
            VStack{
                Image(systemName: imageName).font(.title)
                Text(text)
            }
        })
    }
}


