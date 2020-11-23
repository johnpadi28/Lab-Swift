//
//  RepresentativesData.swift
//  API Project
//
//  Created by John Padilla on 11/12/20.
//

import Foundation
import UIKit

struct RepresentativesData: Codable {
    let results: [RepData]
}

struct RepData: Codable {
    let name: String
    let party: String
    let state: String
    let phone: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case party = "party"
        case state = "state"
        case phone = "phone"
        case address = "office"   
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: CodingKeys.name)
        self.party = try values.decode(String.self, forKey: CodingKeys.party)
        self.state = try values.decode(String.self, forKey: CodingKeys.state)
        self.phone = try values.decode(String.self, forKey: CodingKeys.phone)
        self.address = try values.decode(String.self, forKey: CodingKeys.address)
    }
}
