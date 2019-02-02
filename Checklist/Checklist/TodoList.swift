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
    
    func getItem(at: IndexPath) -> ChecklistItem {
        return items[at.row]
    }
    
    func count() -> Int {
        return items.count
    }
    
    func addNewTodo() -> ChecklistItem {
        let item = ChecklistItem()
        items.append(item)
        return item
    }
    
    func remove(at: Int) {
        items.remove(at: at)
    }
    
    func append(item: ChecklistItem) {
        items.append(item)
    }
    
    func indexOf(item: ChecklistItem) -> Int? {
        return items.firstIndex(of: item)
    }
    
    func move(item: ChecklistItem, to index: Int) {
        guard let currentIndex = items.firstIndex(of: item) else {
            return
        }
        
        items.remove(at: currentIndex)
        items.insert(item, at: index)
    }
    
    func remove(items: [ChecklistItem]) {
        for item in items {
            if let index = items.firstIndex(of: item) {
                self.items.remove(at: index)
            }
        }
    }
}
