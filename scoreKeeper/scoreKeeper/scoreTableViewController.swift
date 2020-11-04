//
//  scoreTableViewController.swift
//  scoreKeeper
//
//  Created by John Padilla on 10/29/20.
//

import UIKit

class scoreTableViewController: UITableViewController, ScoreChangeDelegate {

    var people: [Person] = [Person(name:"Alan", score: 50)]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let loadPeople = Person.loadFromFile() {
            people = loadPeople
        }

    }
    @IBAction func settingButtonTapped(_ sender: Any) {
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Enter Player", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter starting score"
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (action) in
            guard let textFieldArray = alertController.textFields,
                  let nameText = textFieldArray[0].text,
                let scoreText = textFieldArray[1].text,
                let score = Double(scoreText) else { return }
            
            let person = Person(name: nameText, score: score)
            self.people.append(person)
            Person.saveToFiel(people: self.people)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }

        let person = people[indexPath.row]
        cell.delagate = self
        cell.updateView(person: person)
        return cell
    }
    
    func scoredChange(person: Person) {
        Person.saveToFiel(people: people)
    }
}
