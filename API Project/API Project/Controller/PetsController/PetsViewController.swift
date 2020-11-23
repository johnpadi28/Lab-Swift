//
//  PetsViewController.swift
//  API Project
//
//  Created by John Padilla on 11/18/20.
//

import UIKit

class PetsViewController: UIViewController {
    
    let petsViewController = PhotoInfoController()
    
    @IBOutlet var imageView: UIImageView! 
    
    @IBOutlet var randomButton: UIButton! {
        didSet {
            randomButton.layer.cornerRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomimage()
    }
    
    func updateUI(with petsData: PetsData) {
        let task = URLSession.shared.dataTask(with: petsData.image) { (data, response, error) in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        task.resume()
    }
    
    func randomimage() {
        petsViewController.fetchPhotInfo { petsData in
            guard let petsData = petsData else { return }
            self.updateUI(with: petsData)
        }
        
    }

    @IBAction func randomPetBottonPressed(_ sender: UIButton) {
        randomimage()
    }
}
