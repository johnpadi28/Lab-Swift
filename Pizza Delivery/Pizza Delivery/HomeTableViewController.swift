//
//  HomeTableViewController.swift
//  Pizza Delivery
//
//  Created by John Padilla on 10/2/20.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var pizzaNames = ["Cheese Pizza", "Veggie Pizza", "Pepperoni Pizza", "Meat Pizza", "Margherita Pizza", "BBQ Checken Pizza", "Hawaiian Pizza", "Buffalo Pizza"]

    var pizzaImage = ["cheese", "veggie", "pepperoni", "meat", "margherita", "BBQ", "hawaiian", "buffalo"]
    
    var pizzaPrices = ["$15.99", "$17.99", "17.99", "$20.00", "$22.99", "$15.99", "$15.99", "$17.99"]
    
    var pizzaStyles = ["Cheese", "Veggie", "Pepperoni", "Meat", "Margherita", "BBQ", "Hawaiian", "Buffalo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pizzaNames.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DataCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell

        // Configure the cell...
        cell.nameLabel?.text = pizzaNames[indexPath.row]
        cell.priceLabel?.text = pizzaPrices[indexPath.row]
        cell.styleLabel?.text = pizzaStyles[indexPath.row]
        cell.pizzaImage?.image = UIImage(named: pizzaImage[indexPath.row])

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPizzaDetail" {
            if let indexpath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as? pizzaDetailViewController
                destinationController?.imageName = pizzaImage[indexpath.row]
                destinationController?.pizzaName = pizzaNames[indexpath.row]
                destinationController?.pizzaStyle = pizzaStyles[indexpath.row]
                destinationController?.pizzaPrice = pizzaPrices[indexpath.row]
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
