//
//  BooksTableViewController.swift
//  BookList
//
//  Created by John Padilla on 10/13/20.
//

import UIKit

class BooksTableViewController: UITableViewController, BookTableViewDelegate {
    
    func favoriteButtonTapped(cell: BookTableViewCell) {
        let selectIndex = tableView.indexPath(for: cell)
        
        if favoriteIndex == selectIndex {
            favoriteIndex = nil
        } else {
            favoriteIndex = selectIndex
        }
        tableView.reloadData()
    }
    
    
    var books: [Book] = [
    Book(title: "Extreme ownership", author: "Jocko Willink & Leif Babin", notes: "U.S Navy Seals leade and win.")]
    
    var favoriteIndex: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        
        let newBook = Book(title: "", author: "", notes: "")
        books.append(newBook)
        performSegue(withIdentifier: "showDetail", sender: newBook)
    }
    
    func getBook(at indexPath: IndexPath) -> Book {
            books[indexPath.row]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { fatalError("No Cell! 🥺") }

        let book = getBook(at: indexPath)
        cell.configure(with: book, isFavorite: favoriteIndex == indexPath, delegate: self)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = getBook(at: indexPath)
        
        performSegue(withIdentifier: "showDetail", sender: book)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookDetailViewController,
           let book = sender as? Book {
            destination.book = book
        }
    }
}
