//
//  ViewController.swift
//  Checklist
//
//  Created by Alex Prokudin on 30/01/2019.
//  Copyright © 2019 Alex Prokudin. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var todos: TodoList
    
    required init?(coder aDecoder: NSCoder) {
        todos = TodoList(withItems: 500)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        if let label = cell.viewWithTag(1000) as? UILabel {
            if let item = todos.getItem(at: indexPath) {
                label.text = item.text
                configureCheckmark(for: cell, with: item)
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if let item = todos.getItem(at: indexPath) {
                item.checked = !item.checked
                configureCheckmark(for: cell, with: item)
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        cell.accessoryType = item.checked ? .checkmark : .none
    }
}

