//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by John Padilla on 10/12/20.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] = {
        var breakfast = Meal(name: "Breakfast", food: [])
        var lunch = Meal(name: "Lunch", food: [])
        var dinner = Meal(name: "Dinner", food: [])
        
        let burrito = Food(name: "Breakfast Burrito", description: "Egg, tortilla, maybe bacon.")
        let cereal = Food(name: "Cereal", description: "Cereal with cold milk.")
        breakfast.food = [burrito, cereal]
        
        let friedRice = Food(name: "Fried rice", description: "A lot of rice, asian style.")
        lunch.food = [friedRice]
        
        let pizza = Food(name: "Pizza", description: "Hawaiin, Pepperoni, Vegan")
        let saled = Food(name: "Ceaser Saled", description: "A lot of vestages with ranch and cheese")
        dinner.food = [pizza, saled]
        
        return [breakfast, lunch, dinner]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let meal = meals[section]
        return meal.food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        // Configure the cell...
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
