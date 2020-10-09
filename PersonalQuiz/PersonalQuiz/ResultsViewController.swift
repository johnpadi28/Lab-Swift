//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by John Padilla on 10/5/20.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) { (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
//        let frequentAnswerSorted = frequencyOfAnswers.sorted { (part1, pair2) -> Bool in
//            return part1.value > pair2.value
//        }
        
        let mostCommonanswer = frequencyOfAnswers.sorted {$0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonanswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonanswer.definition
    }
    

}
