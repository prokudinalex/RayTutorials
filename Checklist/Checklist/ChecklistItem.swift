//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Alex Prokudin on 31/01/2019.
//  Copyright © 2019 Alex Prokudin. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
