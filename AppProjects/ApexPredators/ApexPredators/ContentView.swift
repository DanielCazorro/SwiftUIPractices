//
//  ContentView.swift
//  ApexPredators
//
//  Created by Daniel Cazorro Frías on 11/11/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var searchText = ""
    @State private var alphabetical = false
    @State private var currentSelection = PredatorType.all
    @State private var selectedMovie: String? = nil // Track selected movie
    
    let predators = Predators()
    
    // All available movies for filtering
    var allMovies: [String] {
        Set(predators.allApexPredators.flatMap { $0.movies }).sorted()
    }
    
    var filteredDinos: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.filter(byMovie: selectedMovie)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { predator in
                NavigationLink {
                    PredatorDetail(predator: predator,
                                   position: .camera(MapCamera(centerCoordinate: predator.location,
                                                               distance: 30000)))
                } label: {
                    HStack {
                        // Dino image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading) {
                            // Name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            // Type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Section("Filter by Type") {
                            Picker("Filter", selection: $currentSelection.animation()) {
                                ForEach(PredatorType.allCases) { type in
                                    Label(type.rawValue.capitalized, systemImage: type.icon)
                                }
                            }
                        }
                        
                        Section("Filter by Movie") {
                            Picker("Movie", selection: $selectedMovie.animation()) {
                                Text("All Movies").tag(String?.none)
                                ForEach(allMovies, id: \.self) { movie in
                                    Text(movie).tag(String?.some(movie))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
