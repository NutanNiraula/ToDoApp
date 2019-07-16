//
//  ViewRepo.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

struct ViewRepo {

    static func getAddTasksVC() -> AddTaskViewController {
        let addTaskVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        addTaskVC.viewModel = AddTaskViewModel()
        return addTaskVC
    }
    
}
