//
//  ContentView.swift
//  TriviaPotter
//
//  Created by Daniel Cazorro Frías on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                
                VStack {
                    VStack {
                        Image(systemName: "bolt.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                        
                        Text("Trivia Potter")
                            .font(.custom(Constants.hpFont, size: 70))
                            .padding(.bottom, -50)
                        
                        Text("Welcome to Trivia Potter!")
                            .font(.custom(Constants.hpFont, size: 55))
                    }
                    .padding(.top, 80)
                    
                    Spacer()
                    
                    VStack {
                        Text("Recent Scores")
                            .font(.title2)
                        
                        Text("50")
                        Text("20")
                        Text("10")
                    }
                    .font(.title3)
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.6))
                    .cornerRadius(22)
                    
                    Spacer()

                    HStack {
                        
                        Spacer()

                        Button {
                            // Show instructions screen
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                        
                        Button {
                            // Start new game
                        } label: {
                            Text("Play")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 50)
                                .background(.green)
                                .cornerRadius(24)
                                .shadow(radius: 5)
                        }

                        Spacer()
                        
                        Button {
                            // Show settings screen
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        Spacer()
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()

                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
