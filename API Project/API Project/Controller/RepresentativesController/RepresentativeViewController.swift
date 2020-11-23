//
//  RepresentativeViewController.swift
//  API Project
//
//  Created by John Padilla on 11/12/20.
//

import UIKit

class RepresentativeViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate, RepresentativeManagerDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchTextField: UITextField!

    var representativeManager = RepresentativeManager()
    var repres = [RepData]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        representativeManager.delegate = self
        searchTextField.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
    }
  
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! RepTableViewCell
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    //MARK: - UITextField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Please enter Zip Code"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let zipcode = searchTextField.text {
            representativeManager.fetchRepresentatives(zipCode: zipcode)
        }
        searchTextField.text = ""
    }
    
    func didUpdateRepresentative(_ representativeManage: RepresentativeManager, representative: RepresentativesData) {
        repres = representative.results
        tableView.reloadData()
        
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let repr = repres[indexPath.row]
        cell.textLabel?.text = repr.name
        cell.detailTextLabel?.text = repr.party
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
