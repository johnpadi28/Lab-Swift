//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by John Padilla on 11/11/20.
//  Copyright © 2020 Caleb Hicks. All rights reserved.
//

import Foundation
import UIKit

struct StoreItems: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable {
    let artist: String
    let name: String
    let genre: String
    var artworkURL: URL
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case name = "trackName"
        case genre = "primaryGenreName"
        case artworkURL = "artworkUrl100"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.artist = try values.decode(String.self, forKey: CodingKeys.artist)
        self.name = try values.decode(String.self, forKey: CodingKeys.name)
        self.genre = try values.decode(String.self, forKey: CodingKeys.genre)
        self.artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
        
    }
}

