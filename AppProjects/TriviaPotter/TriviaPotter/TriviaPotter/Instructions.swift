//
//  Instructions.swift
//  TriviaPotter
//
//  Created by Daniel Cazorro Frías on 7/1/25.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView {
                    Text("How To Play")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to Trivia Potter! In this game, you'll be asked random questions from the Harry Potter Universe. You must guess the right answer and collect points! If you get too many questions wrong, you'll lose the game. Good luck!")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question is worth 5 points, but if you get too many questions wrong, you'll lose the game.")
                            .padding([.horizontal, .bottom])
                        
                        Text("You have 10 questions to answer.")
                            .padding([.horizontal, .bottom])

                        Text("If you are ready to play, tap the 'Start Game' button below!")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question will have four options.")
                            .padding([.horizontal, .bottom])
                        
                        Text("When you select the correct answer, you'll see a green checkmark appear. If you select the wrong answer, you'll see a red cross appear.")
                            .padding(.horizontal)

                    }
                    .font(.title3)
                    
                    Text("Good luck!")
                        .font(.title)
                }
                .foregroundStyle(.black)
                
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }
        }
    }
}

#Preview {
    Instructions()
}
