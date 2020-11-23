//
//  PetDetailController.swift
//  API Project
//
//  Created by John Padilla on 11/18/20.
//

import Foundation

class PhotoInfoController {
    func fetchPhotInfo(completion: @escaping (PetsData?) -> Void) {
        
        let url = URL(string: "https://dog.ceo/api/breeds/image/random#")!        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            if let data = data,
               let petsData = try? jsonDecoder.decode(PetsData.self, from: data) {
                completion(petsData)
            } else {
                print("DEBUG: Either no data was returned, or data was not serialized")
                completion(nil)
            }
        }
        task.resume()
    }
}
