//
//  BookDetailViewController.swift
//  BookList
//
//  Created by John Padilla on 10/13/20.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    //MARK: Variables
    var book: Book?
    
    //MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = book?.title
        
        titleTextField.text = book?.title
        authorTextField.text = book?.author
        noteTextView.text = book?.notes
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text,
              let author = authorTextField.text,
              let notes = noteTextView.text else { return }
        
        book?.title = title
        book?.author = author
        book?.notes = notes
        self.title = book?.title
        dismiss(animated: true, completion: nil)
    }
}
