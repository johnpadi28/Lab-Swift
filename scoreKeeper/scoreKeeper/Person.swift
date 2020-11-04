//
//  Person.swift
//  scoreKeeper
//
//  Created by John Padilla on 10/29/20.
//

import UIKit

class Person: Codable {
    var name: String
    var score: Double
    
    init(name: String, score: Double) {
        self.name = name
        self.score = score
    }
    
    //where we it us stored
    static let DocummentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    //How to get to the storage place
    static let ArchiveURL = DocummentsDirectory.appendingPathComponent("people").appendingPathExtension("plist")

    static func saveToFiel(people: [Person]) {
        
        let encoder = PropertyListEncoder()
        //Turn model objects into file
        let codePeople = try? encoder.encode(people)
        //Save to file
        try? codePeople?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Person]? {
        //Get file from storage
        guard let codePeople = try? Data(contentsOf: ArchiveURL) else { return nil}
        let decoder = PropertyListDecoder()
        //Turn file back into model objects
        return try? decoder.decode(Array<Person>.self, from: codePeople)
    }
}
