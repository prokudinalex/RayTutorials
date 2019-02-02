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
        addTodo(item2, for: .high)
    }
    
    func addNewTodo() -> ChecklistItem {
        let item = ChecklistItem()
        mediumPriorityTodos.append(item)
        return item
    }
    
    func move(item: ChecklistItem, from src: Priority, at srcIndex: Int, to dst: Priority, at dstIndex: Int) {
        remove(item, from: src, at: srcIndex)
        addTodo(item, for: dst, at: dstIndex)
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
    
    func addTodo(_ item: ChecklistItem, for priority: Priority, at index: Int = -1) {
        switch priority {
        case .high:
            index < 0 ? highPriorityTodos.append(item) : highPriorityTodos.insert(item, at: index)
        case .medium:
            index < 0 ? mediumPriorityTodos.append(item) : mediumPriorityTodos.insert(item, at: index)
        case .low:
            index < 0 ? lowPriorityTodos.append(item) : lowPriorityTodos.insert(item, at: index)
        case .no:
            index < 0 ? noPriorityTodos.append(item) : noPriorityTodos.insert(item, at: index)
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
