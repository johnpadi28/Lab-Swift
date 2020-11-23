//
//  RepresentativeController.swift
//  API Project
//
//  Created by John Padilla on 11/12/20.
//

import Foundation
import UIKit

protocol RepresentativeManagerDelegate {
    func didUpdateRepresentative(_ representativeManage: RepresentativeManager, representative: RepresentativesData)
    func didFailWithError(error: Error)
}

struct RepresentativeManager {
    
    var delegate: RepresentativeManagerDelegate?

    func fetchRepresentatives(zipCode: String) {
        let representativesURL = "https://whoismyrepresentative.com/getall_mems.php?zip=\(zipCode)&output=json#"
        performRequest(with: representativesURL)
    }
    
    func performRequest(with representativeURL:  String) {
        if let url = URL(string: representativeURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let representative = self.parseJSON(safeData) {
                        
                        DispatchQueue.main.async {
                            self.delegate?.didUpdateRepresentative(self, representative: representative)
                        }
                    }
                } 
            }
            task.resume()
        }
    }
    
    func parseJSON(_ representativeData: Data) -> RepresentativesData? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(RepresentativesData.self, from: representativeData)
            let repr = decodeData
            return repr
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
