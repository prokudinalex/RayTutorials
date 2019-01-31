//
//  TodoList.swift
//  Checklist
//
//  Created by Alex Prokudin on 31/01/2019.
//  Copyright © 2019 Alex Prokudin. All rights reserved.
//

import Foundation

class TodoList {
    private var items: [ChecklistItem] = []
    
    func getItem(at: IndexPath) -> ChecklistItem? {
        if (items.count > at.row) {
            return items[at.row]
        }
        return Optional.none
    }
    
    func count() -> Int {
        return items.count
    }
    
    func addNewTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = "New todo"
        items.append(item)
        return item
    }
    
    func remove(at: Int) {
        items.remove(at: at)
    }
    
    func append(item: ChecklistItem) {
        items.append(item)
    }
}
