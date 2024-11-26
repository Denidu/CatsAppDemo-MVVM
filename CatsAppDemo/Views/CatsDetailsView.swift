//
//  CatsDetailsView.swift
//  CatsAppDemo
//
//  Created by Denidu Gamage on 2024-10-24.
//

import SwiftUI

struct CatsDetailsView: View {
    @ObservedObject var viewModel = CatsViewModel()
    let breed: CatModel
    @State var isExpanded: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                
                AsyncImage(url: URL(string: viewModel.createImageUrl(imageId: breed.ImageId))) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                            .scaledToFit()
                    } else if phase.error != nil {
                        Image(systemName: "cat.circle.fill")
                            .resizable()
                            .frame(width: 300, height: 300)
                    } else {
                        ProgressView()
                    }
                }
                
                VStack(alignment: .leading) {

                    Text(breed.name)
                        .font(.title)
                        .padding(.bottom, 2)
                    
                    Text(breed.description)
                        .padding(.bottom, 2)
                    
                    Text("Temperament: \(breed.temperament)")
                        .padding(.bottom, 2)
                    

                    if isExpanded {
                        if let origin = breed.origin {
                            Text("Origin: \(origin)")
                        }
                        if let lifeSpan = breed.lifeSpan {
                            Text("Life Span: \(lifeSpan) years")
                        }
                        if let affectionLevel = breed.affectionLevel {
                            Text("Affection Level: \(affectionLevel)/5")
                        }
                        if let intelligence = breed.intelligence {
                            Text("Intelligence: \(intelligence)/5")
                        }
                        if let dogFriendly = breed.dogFriendly {
                            Text("Dog Friendly: \(dogFriendly)/5")
                        }
                        if let sheddingLevel = breed.sheddingLevel {
                            Text("Shedding Level: \(sheddingLevel)/5")
                        }
                        if let wikipediaURL = breed.wikipediaURL {
                            Link("More info on Wikipedia", destination: URL(string: wikipediaURL)!)
                        }
                    }

                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Text(isExpanded ? "See Less" : "See More")
                            .foregroundColor(.blue)
                            .padding(.top, 5)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(breed.name)
        .padding()
    }
}

//#Preview {
//    let sampleBreed = CatModel(
//        id: "abys",
//        name: "Abyssinian",
//        temperament: "Active, Energetic, Independent, Intelligent, Gentle",
//        description: "The Abyssinian is one of the oldest known cat breeds, and it's known for its energetic, playful nature.",
//        ImageId: nil,
//        vetstreetURL: nil,
//        vcahospitalsURL: nil,
//        origin: "Egypt",
//        countryCodes: "EG",
//        countryCode: "EG",
//        lifeSpan: "9 - 15",
//        indoor: 1,
//        lap: 1,
//        altNames: nil,
//        adaptability: 5,
//        affectionLevel: 5,
//        childFriendly: 4,
//        dogFriendly: 5,
//        energyLevel: 5,
//        grooming: 2,
//        healthIssues: 3,
//        intelligence: 5,
//        sheddingLevel: 3,
//        socialNeeds: 4,
//        strangerFriendly: 4,
//        vocalisation: 3,
//        experimental: 0,
//        hairless: 0,
//        natural: 1,
//        rare: 0,
//        rex: 0,
//        suppressedTail: 0,
//        shortLegs: 0,
//        wikipediaURL: "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
//        hypoallergenic: 1
//    )
//    
//    CatsDetailsView(breed: sampleBreed)
//}
