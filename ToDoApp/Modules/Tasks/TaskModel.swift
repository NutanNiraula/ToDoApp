//
//  TaskModel.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import Foundation

class TaskModel: NSObject, NSCoding {
    
    private(set) var taskId = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    private(set) var dateAdded: Date = Date()
    
    var dateAddedString: String {
        let dateFormatterReadable = DateFormatter()
        dateFormatterReadable.dateFormat = "MMM dd, h:mm"
        return dateFormatterReadable.string(from: dateAdded)
    }
    
    init(title: String,
         description: String) {
        self.taskTitle = title
        self.taskDescription = description
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(taskId, forKey: "taskId")
        aCoder.encode(taskTitle, forKey: "title")
        aCoder.encode(dateAdded, forKey: "dateAdded")
        aCoder.encode(taskDescription, forKey: "description")
    }
    
    required init?(coder aDecoder: NSCoder) {
        taskId = aDecoder.decodeObject(forKey: "taskId") as! String
        taskTitle = aDecoder.decodeObject(forKey: "title") as! String
        taskDescription = aDecoder.decodeObject(forKey: "description") as! String
        dateAdded = aDecoder.decodeObject(forKey: "dateAdded") as! Date
    }
}
