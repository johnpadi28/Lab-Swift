//
//  DatePickerTableViewCell.swift
//  HappyBirthday
//
//  Created by John Padilla on 10/27/20.
//

import UIKit

protocol DatePickerCellDelegate {
    func dateChanged(to date: Date)
}

class DatePickerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func datePickerChangef(_ sender: Any) {
        
        delegate?.dateChanged(to: datePicker.date)
    }
}
