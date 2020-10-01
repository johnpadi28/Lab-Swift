//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by John Padilla on 10/1/20.
//

import UIKit

class MiddleViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var eventNumber: Int = 1
    
    func addEvent(from: String) {
        if let existingText = label.text {
            label.text = "\(existingText) \nEvent number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        addEvent(from: "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addEvent(from: "ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        addEvent(from: "ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        addEvent(from: "ViewWillDesappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        addEvent(from: "ViewDidDisappear")
    }
    
}
