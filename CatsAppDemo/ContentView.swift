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
                    CatsDetailsView(breed: breed)
                } label: {
                    HStack(spacing: 15) {
                        AsyncImage(url: URL(string: viewModel.createImageUrl(imageId: breed.ImageId))) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } else if phase.error != nil {
                                Image(systemName: "cat.circle.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.gray)
                            } else {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(breed.name)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.primary)
                            
                            Text(breed.temperament)
                                .font(.subheadline)
                                .fontWeight(.light)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 330, height: 130)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(.systemBackground))
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            
                    )
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Choose Your Cats")
            .listStyle(PlainListStyle())
            .searchable(text: $viewModel.searchText, prompt: "Search")
            .onChange(of: viewModel.searchText) {
                viewModel.filterBreeds()
            }
            .onAppear {
                Task {
                    await viewModel.fetchCatBreeds()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
