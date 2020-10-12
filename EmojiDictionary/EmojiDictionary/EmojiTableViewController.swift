//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by John Padilla on 10/12/20.
//

import UIKit

var emojis: [Emoji] = [Emoji(symbol: "😀", name: "Grinnin face", description: "A typical smiley face", usage: "Happiness"),
Emoji(symbol: "🙁", name: "Confuse face", description: "A confused, puzzled face", usage: "Unsure what to think; displeasure."),
Emoji(symbol: "😍", name: "Heart eyes", description: "A smiley face with hearts for eyer.", usage: "Love of something; atractive."),
Emoji(symbol: "👮‍♀️", name: "Police officer", description: "A police office wearing a blue cap with a gold badge.", usage: "Person of authority."),
Emoji(symbol: "🐢", name: "Turtle", description: "A cute Turtle.", usage: "Something slow."),
Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant", usage: "Good memory."),
Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of Spaghetti", usage: "Spaghetti."),
Emoji(symbol: "🎲", name: "Dice", description: "A single dice", usage: "Taking a risk, change; game."),
Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "Camping"),
Emoji(symbol: "📚", name: "Stack of Books.", description: "Three colored books stacked in each other.", usage: "Homework, studying."),
Emoji(symbol: "💔", name: "Broken Heart", description: "A red,, broken heart.", usage: "Extreme sadness"),
Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "Tired sleepiness."),
Emoji(symbol: "🏁", name: "Checking Flag", description: "A black and white checkered flag", usage: "completion")]


class EmojiTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)

        let emoji = emojis[indexPath.row]
        
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = "\(emoji.description)"
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol) \(indexPath)")
        
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.none
    }
}
