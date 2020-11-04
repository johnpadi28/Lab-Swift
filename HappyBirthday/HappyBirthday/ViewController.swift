//
//  ViewController.swift
//  HappyBirthday
//
//  Created by John Padilla on 10/27/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DatePickerCellDelegate {

    
    
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var showDatePicker = false
    
    let dateButtonCellIndex = 0
    let datePickerCellIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        switch indexPath.row {
        case dateButtonCellIndex:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateButton", for: indexPath)
            cell.textLabel?.text = "Choose your Date!"
            return cell
        case datePickerCellIndex:
            let cell = tableView.dequeueReusableCell(withIdentifier: "datePicker", for: indexPath) as! DatePickerTableViewCell
            cell.datePicker.datePickerMode = .date
            cell.delegate = self
            //Configure
        
            return cell
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case dateButtonCellIndex:
            return UITableView.automaticDimension
        case datePickerCellIndex:
            return showDatePicker ? 215 : 0
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case dateButtonCellIndex:
            showDatePicker.toggle()
            tableView.reloadData()
        default:
            return
        }
    }
    
    func dateChanged(to date: Date) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        birthdateLabel.text = "Your Birthdate is: \(dateFormatter.string(from: date))"
    }
}

