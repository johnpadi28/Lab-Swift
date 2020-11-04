//
//  PersonTableViewCell.swift
//  scoreKeeper
//
//  Created by John Padilla on 10/29/20.
//

import UIKit

protocol ScoreChangeDelegate {
    func scoredChange(person: Person)
}

class PersonTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var scoreStepper: UIStepper!
    
    var person: Person?
    var delagate: ScoreChangeDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        scoreTextField.delegate = self
        // Initialization code
    }
    
    func updateView(person: Person) {
        self.person = person
        nameLabel.text = person.name
        let formattedString = String(format: "%.0f", person.score)
        scoreTextField.text = formattedString
        scoreStepper.value = person.score
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = scoreTextField.text,
              let number = Double(text) else { return true}
        scoreStepper.value = number
        return true
    }
    
    @IBAction func stepperTapped(_ sender: Any) {
        if let person = person {
            person.score = scoreStepper.value
            let formattedString = String(format: "%.0f", scoreStepper.value)
            scoreTextField.text = formattedString
            delagate?.scoredChange(person: person)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
