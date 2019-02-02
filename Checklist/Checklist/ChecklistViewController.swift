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
    
    private func priorityForSectionIndex(_ index: Int) -> TodoList.Priority? {
        return TodoList.Priority(rawValue: index)
    }
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    required init?(coder aDecoder: NSCoder) {
        todos = TodoList()
        todos.initialize()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.allowsMultipleSelectionDuringEditing = true
        deleteButton.isEnabled = false
        deleteButton.tintColor = UIColor.clear
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String? = nil
        if let priority = priorityForSectionIndex(section) {
            switch priority {
            case .high:
                title = "High priority"
            case .medium:
                title = "Medium priority"
            case .low:
                title = "Low priority"
            case .no:
                title = "No priority"
            }
        }
        return title
    }
    
    @IBAction func deleteItems(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            for indexPath in selectedRows {
                if let priority = priorityForSectionIndex(indexPath.section) {
                    let items = todos.todoList(for: priority)
                    
                    let rowToDelete = indexPath.row > items.count - 1 ? items.count - 1 : indexPath.row
                    let item = items[rowToDelete]
                    todos.remove(item, from: priority, at: rowToDelete)
                }
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(tableView.isEditing, animated: true)
        
        deleteButton.isEnabled = editing
        deleteButton.tintColor = editing ? nil : UIColor.clear
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let priority = priorityForSectionIndex(section) {
            return todos.todoList(for: priority).count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        if let priority = priorityForSectionIndex(indexPath.section) {
            let items = todos.todoList(for: priority)
            let item = items[indexPath.row]
            configureText(for: cell, with: item)
            configureCheckmark(for: cell, with: item)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            return
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if let priority = priorityForSectionIndex(indexPath.section) {
                let items = todos.todoList(for: priority)
                let item = items[indexPath.row]
                item.toggleChecked()
                configureCheckmark(for: cell, with: item)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if let srcPriority = priorityForSectionIndex(sourceIndexPath.section),
            let dstPriority = priorityForSectionIndex(destinationIndexPath.section) {
            let item = todos.todoList(for: srcPriority)[sourceIndexPath.row]
            todos.move(item: item, from: srcPriority, at: sourceIndexPath.row, to: dstPriority, at: destinationIndexPath.row)
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let priority = priorityForSectionIndex(indexPath.section) {
            var items = todos.todoList(for: priority)
            let item = items[indexPath.row]
            todos.remove(item, from: priority, at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        if let checkmarkCell = cell as? ChecklistTableViewCell {
            checkmarkCell.todoTextLabel.text = item.text
        }
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        guard let checkmarkCell = cell as? ChecklistTableViewCell else {
            return
        }
        
        checkmarkCell.checkmarkLabel.text = item.checked ? "√" : ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue" {
            if let addItemVC = segue.destination as? ItemDetailViewController {
                addItemVC.delegate = self
                addItemVC.todoList = todos
            }
        } else if segue.identifier == "EditItemSegue" {
            if let addItemVC = segue.destination as? ItemDetailViewController {
                if let cell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for: cell),
                    let priority = priorityForSectionIndex(indexPath.section) {
                    let items = todos.todoList(for: priority)
                    let item = items[indexPath.row]
                    addItemVC.itemToEdit = item
                    addItemVC.delegate = self
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TodoList.Priority.allCases.count
    }
}

extension ChecklistViewController: ItemDetailViewControllerDelegate {

    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {
        let rowIndex = todos.todoList(for: .medium).count - 1
        let indexPath = IndexPath(row: rowIndex, section: TodoList.Priority.medium.rawValue)
        tableView.insertRows(at: [indexPath], with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        for priority in TodoList.Priority.allCases {
            let currentList = todos.todoList(for: priority)
            if let index = currentList.firstIndex(of: item) {
                let indexPath = IndexPath(row: index, section: priority.rawValue)
                if let cell = tableView.cellForRow(at: indexPath) {
                    configureText(for: cell, with: item)
                }
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
