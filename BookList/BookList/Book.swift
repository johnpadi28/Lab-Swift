//
//  Books.swift
//  BookList
//
//  Created by John Padilla on 10/13/20.
//

import Foundation

class Book {
    
    var title: String
    var author: String
    var notes: String
    
    init(title: String, author: String, notes: String) {
        self.title = title
        self.author = author
        self.notes = notes
    }
}
