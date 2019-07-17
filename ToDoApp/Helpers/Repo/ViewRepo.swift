//
//  ViewRepo.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {}

struct ViewRepo {
    
    static func getMainNavigationController() -> MainNavigationController {
       let mainNC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
        mainNC.viewControllers = [ViewRepo.getTasksVC()]
        return mainNC
    }
    
    static func getTasksVC() -> TasksViewController {
        let tasksVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TasksViewController") as! TasksViewController
        tasksVC.viewModel = TasksViewModel(urlsession: URLSession.shared, userDefault: UserDefaults.standard)
        return tasksVC
    }

    static func getAddTasksVC() -> AddTaskViewController {
        let addTaskVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        addTaskVC.viewModel = AddTaskViewModel()
        return addTaskVC
    }
    
    static func getAboutVC(withInfo info: String) -> AboutViewController {
        let aboutVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        aboutVC.aboutDescription = info
        return aboutVC
    }
    
}
