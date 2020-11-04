//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by John Padilla on 10/12/20.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    

    
    static func loadSampleEmojis() -> [Emoji] {
        
        return [
            Emoji(symbol: "😀", name: "Grinnin face", description: "A typical smiley face", usage: "Happiness"),
            Emoji(symbol: "🙁", name: "Confuse face", description: "A confused, puzzled face", usage: "Unsure what to think; displeasure."),
            Emoji(symbol: "😍", name: "Heart eyes", description: "A smiley face with hearts for eyer.", usage: "Love of something; atractive."),
            Emoji(symbol: "👮‍♀️", name: "Police officer", description: "A police office wearing a blue cap with a gold badge.", usage: "Person of authority."),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute Turtle.", usage: "Something slow."),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant", usage: "Good memory."),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of Spaghetti", usage: "Spaghetti."),
            Emoji(symbol: "🎲", name: "Dice", description: "A single dice", usage: "Taking a risk, change; game."),
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "Camping"),
            Emoji(symbol: "📚", name: "Stack of Books.", description: "Three colored books stacked in each other.", usage: "Homework, studying."),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red,, broken heart.", usage: "Extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "Tired sleepiness."),
            Emoji(symbol: "🏁", name: "Checking Flag", description: "A black and white checkered flag", usage: "completion")
        ]
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let propertyListEncoder = PropertyListEncoder()
        let codeEmojis = try? propertyListEncoder.encode(emojis)

        try? codeEmojis?.write(to: ArchiveURL, options: .noFileProtection)
        
    }
    
    static func loadFromfile() -> [Emoji]? {
        guard let codeEmojis = try? Data(contentsOf: ArchiveURL) else { return nil}
        
        let propertyListDecoder = PropertyListDecoder()
    
        return try? propertyListDecoder.decode(Array<Emoji>.self, from: codeEmojis)
    }
    
}

