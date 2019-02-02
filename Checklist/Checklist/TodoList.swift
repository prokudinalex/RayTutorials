//
//  TodoList.swift
//  Checklist
//
//  Created by Alex Prokudin on 31/01/2019.
//  Copyright © 2019 Alex Prokudin. All rights reserved.
//

import Foundation

class TodoList {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos: [ChecklistItem] = []
    private var mediumPriorityTodos: [ChecklistItem] = []
    private var lowPriorityTodos: [ChecklistItem] = []
    private var noPriorityTodos: [ChecklistItem] = []
    
    func initialize() {
        let item1 = ChecklistItem()
        item1.text = "Check 1"
        addTodo(item1, for: .medium)
        
        let item2 = ChecklistItem()
        item2.text = "Alpha 1"
        addTodo(item2, for: .medium)
    }
    
    func addNewTodo() -> ChecklistItem {
        let item = ChecklistItem()
        mediumPriorityTodos.append(item)
        return item
    }
    
    func move(item: ChecklistItem, to index: Int) {
//        guard let currentIndex = items.firstIndex(of: item) else {
//            return
//        }
//
//        items.remove(at: currentIndex)
//        items.insert(item, at: index)
    }
    
    func todoList(for priority: Priority) -> [ChecklistItem] {
        switch priority {
        case .high:
            return highPriorityTodos
        case .medium:
            return mediumPriorityTodos
        case .low:
            return lowPriorityTodos
        case .no:
            return noPriorityTodos
        }
    }
    
    func addTodo(_ item: ChecklistItem, for priority: Priority) {
        switch priority {
        case .high:
            highPriorityTodos.append(item)
        case .medium:
            mediumPriorityTodos.append(item)
        case .low:
            lowPriorityTodos.append(item)
        case .no:
            noPriorityTodos.append(item)
        }
    }
    
    func remove(_ item: ChecklistItem, from priority: Priority, at index: Int) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
}
