//
//  AddTaskViewModel.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import Foundation

class AddTaskViewModel {
    
    var isValidForm: Bool {
        return !(self.title ?? "").isEmpty && !(self.description ?? "").isEmpty
    }
    
    var validityObserver: ((Bool) -> ())?

    var title: String? {
        didSet {
            validityObserver?(isValidForm)
        }
    }
    
    var description: String? {
        didSet {
            validityObserver?(isValidForm)
        }
    }
    
    init() {}
    
    func getTaskModel() -> TaskModel {
        return TaskModel(title: title ?? "",
                         description: description ?? "")
    }
    
}
