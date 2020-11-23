//
//  PetsData.swift
//  API Project
//
//  Created by John Padilla on 11/18/20.
//

import Foundation

struct PetsData: Codable {
    var image: URL
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case image = "message"
        case status
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try valueContainer.decode(URL.self, forKey: CodingKeys.image)
        self.status = try valueContainer.decode(String.self, forKey: CodingKeys.status)
    }
}
