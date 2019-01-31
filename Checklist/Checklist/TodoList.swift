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
    
    init(withItems: Int) {
        for i in 1...withItems {
            let item = ChecklistItem()
            item.text = "Item at \(i)"
            items.append(item)
        }
    }
    
    func getItem(at: IndexPath) -> ChecklistItem? {
        if (items.count > at.row) {
            return items[at.row]
        }
        return Optional.none
    }
    
    func count() -> Int {
        return items.count
    }
}
