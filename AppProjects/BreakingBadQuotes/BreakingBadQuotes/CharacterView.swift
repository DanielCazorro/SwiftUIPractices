//
//  CharacterView.swift
//  BreakingBadQuotes
//
//  Created by Daniel Cazorro Frías on 15/12/24.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    let show: String
    
    @State private var randomIndex: Int = 0 // Índice aleatorio inicial
    
    var body: some View {
        GeometryReader { geo in
            ScrollViewReader { proxy in
                ZStack(alignment: .top) {
                    Image(show.removeCaseAndSpace())
                        .resizable()
                        .scaledToFit()
                    
                    ScrollView {
                        TabView(selection: $randomIndex) {
                            ForEach(character.images.indices, id: \.self) { index in
                                AsyncImage(url: character.images[index]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .tag(index) // Asignamos un `tag` al índice
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
                        .clipShape(.rect(cornerRadius: 25))
                        .padding(.top, 60)
                        .onAppear {
                            // Configuramos un índice aleatorio cuando se monta la vista
                            if !character.images.isEmpty {
                                randomIndex = Int.random(in: 0..<character.images.count)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.largeTitle)
                            
                            Text("Portrayed by: \(character.portrayedBy)")
                                .font(.subheadline)
                            
                            Divider()
                            
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            
                            Text("Born: \(character.birthday)")
                            
                            Divider()
                            
                            Text("Occupations:")
                            
                            ForEach(character.occupations, id: \.self) { occupation in
                                Text("•\(occupation)")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            Text("Nicknames:")
                            
                            if character.aliases.count > 0 {
                                ForEach(character.aliases, id: \.self) { alias in
                                    Text("•\(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            DisclosureGroup("Status (spoiler alert!)") {
                                VStack(alignment: .leading) {
                                    Text(character.status)
                                        .font(.title2)
                                    
                                    if let death = character.death {
                                        AsyncImage(url: death.image) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(.rect(cornerRadius: 15))
                                                .onAppear {
                                                    withAnimation {
                                                        proxy.scrollTo(1, anchor: .bottom)
                                                    }
                                                }
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        
                                        Text("How \(death.details)")
                                            .padding(.bottom, 8)
                                        
                                        Text("Last words:  \(death.lastWords)\"")
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .tint(.primary)
                        }
                        .frame(width: geo.size.width/1.25, alignment: .leading)
                        .padding(.bottom, 50)
                        .id(1)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView(character: ViewModel().character, show: Constants.bbName)
}
