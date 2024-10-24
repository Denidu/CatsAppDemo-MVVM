//
//  ContentView.swift
//  CatsAppDemo
//
//  Created by Denidu Gamage on 2024-10-24.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = CatsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.filteredBreeds) { breed in
                NavigationLink {
                    
                }label: {
                    HStack {
                        AsyncImage(url: URL(string: viewModel.createImageUrl(imageId: breed.ImageId))) {phase in
                            
                            if let image = phase.image{
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                    .cornerRadius(10)
                            }else if phase.error != nil{
                                Image(systemName: "cat.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                
                            }else{
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(breed.name)
                            Text(breed.temperament)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchCatBreeds()
            }
        }.navigationTitle("Choose Your Cats")
                .padding()
                .searchable(text: $viewModel.searchText, prompt: "Search")
                .onChange(of: viewModel.searchText){
                    viewModel.filterBreeds()
                    
                }
             }
   }

#Preview {
    ContentView()
}
