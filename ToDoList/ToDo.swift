//
//  ToDoModel.swift
//  ToDoList
//
//  Created by Andreas Schmitt on 16.04.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import Foundation



class ToDo {
    let defaults = UserDefaults.standard
    
    var toDoListArray = [ToDoItem]()
    
    func save(item: ToDoItem) -> Bool {
        self.toDoListArray.append(item)
        return true
    }
    
    func getList() -> [ToDoItem] {
        return self.toDoListArray
    }
    
    func count() -> Int {
        return self.toDoListArray.count
    }
}
