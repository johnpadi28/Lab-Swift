//
//  pizzaDetailViewController.swift
//  Pizza Delivery
//
//  Created by John Padilla on 10/2/20.
//

import UIKit

class pizzaDetailViewController: UIViewController {
    
    var imageName = ""
    var pizzaName = ""
    var pizzaStyle = ""
    var pizzaPrice = ""
    

    @IBOutlet var pizzaImageName: UIImageView!
    @IBOutlet var pizzaNameLabel: UILabel!
    @IBOutlet var pizzaStyleLabel: UILabel!
    @IBOutlet var pizzaPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pizzaImageName.image = UIImage(named: imageName)
        pizzaNameLabel.text = pizzaName
        pizzaStyleLabel.text = pizzaStyle
        pizzaPriceLabel.text = pizzaPrice
        
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
