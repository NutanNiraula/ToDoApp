//
//  ViewController.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/15/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {

    @IBOutlet var taskTableView: EmptyIndicatingTableView!
    @IBOutlet var addTaskButton: UIButton!
    
    lazy var taskTableDataSourceDelegate: TasKTableDataSourceDelegate = {
        return TasKTableDataSourceDelegate(forTableView: self.taskTableView)
    }()
    
    @IBAction func onAddTaskBtnTapped(_ sender: Any) {
        let addTaskVC = ViewRepo.getAddTasksVC()
        addTaskVC.delegate = self
        self.present(addTaskVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTasksTableView()
    }
    
    private func setupTasksTableView() {
        taskTableView.emptyTableViewDataSource = taskTableDataSourceDelegate
        taskTableView.delegate = taskTableDataSourceDelegate
        taskTableView.dataSource = taskTableDataSourceDelegate
    }

}

extension TasksViewController: AddTaskViewControllerDelegate {
    
    func didSetTask(task: TaskModel) {
        taskTableDataSourceDelegate.model.append(task)
        taskTableView.insertRows(at: [IndexPath(row: taskTableDataSourceDelegate.model.count - 1, section: 0)], with: .left)
        taskTableView.scrollToRow(at: IndexPath(row: taskTableDataSourceDelegate.model.count - 1, section: 0), at: .bottom, animated: true)
    }
    
}
