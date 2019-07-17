//
//  TaskModel.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import Foundation

struct TaskModel {
    
    private(set) var taskId = UUID().uuidString
    var title: String
    var description: String
    private(set) var dateAdded: Date = Date()
    
    var dateAddedString: String {
        let dateFormatterReadable = DateFormatter()
        dateFormatterReadable.dateFormat = "MMM dd, h:mm a"
        return dateFormatterReadable.string(from: dateAdded)
    }
    
    init(title: String,
         description: String) {
        self.title = title
        self.description = description
    }
    
}
