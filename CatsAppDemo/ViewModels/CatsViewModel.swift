//
//  CatsViewModel.swift
//  CatsAppDemo
//
//  Created by Denidu Gamage on 2024-10-24.
//

import Foundation

class CatsViewModel:ObservableObject{
    
    @Published var breeds: [CatModel] = []
    @Published var filteredBreeds : [CatModel] = []
    @Published var searchText:String = ""
    
    func fetchCatBreeds() async {
        guard let url = URL(string:"https://api.thecatapi.com/v1/breeds") else {
            return
        }
        do{
            
            let (data, response)  = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse else{
                print("Something Went Wrong")
                return
            }
            
            guard response.statusCode == 200 else{
                print("Invalid response Code")
                return
            }
            
            let decodedData = try JSONDecoder().decode([CatModel].self, from: data)
            
            DispatchQueue.main.async {
                self.breeds = decodedData
                self.filteredBreeds = decodedData
            }
            
        }catch{
            print("Something Went Wrong \(error.localizedDescription)")
            
        }
    }
    
    func createImageUrl(imageId:String?) -> String{
        guard let imageRef = imageId else{
            print("No Image Reference")
            return ""
        }
        return "https://cdn2.thecatapi.com/images/\(imageRef).jpg"
    }
    
    func filterBreeds(){
        if searchText.isEmpty{
            filteredBreeds = breeds
        }else{
            filteredBreeds = breeds.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
        
    }
}
