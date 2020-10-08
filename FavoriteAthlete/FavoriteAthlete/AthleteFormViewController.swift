//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by John Padilla on 10/8/20.
//

import UIKit

class AthleteFormViewController: UIViewController {

    var athlete : Athlete?
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    @IBAction func saveButtnPressed(_ sender: Any) {
        guard let name = nameTextField.text,
              let ageText = ageTextField.text,
              let age = ageTextField.text,
              let leage = leagueTextField.text,
              let team = teamTextField.text  else { return }
        
        athlete = Athlete(name: name, age: age, league: leage, team: team)
        performSegue(withIdentifier: "newUnwind", sender: self)
    }
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = athlete.age
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }

}
