//
//  TaskTableDataSource.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

class TaskTableDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    lazy var model: [TaskModel] = {
        guard let data = UserDefaults.standard.value(forKey: AppConstants.UserDefaultKeys.toDoList) else { return [] }
        return try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as! [TaskModel]
    }()
    
    private var taskTableView: EmptyIndicatingTableView!
    
    init(forTableView tableView: EmptyIndicatingTableView) {
        self.taskTableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksTableViewCell") as! TasksTableViewCell
        cell.model = model[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(at: indexPath.row)
            UserDefaults.standard.setValue(NSKeyedArchiver.archivedData(withRootObject: model),
                                           forKey: AppConstants.UserDefaultKeys.toDoList)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.taskTableView.dataSource?.tableView!(self.taskTableView, commit: .delete, forRowAt: indexPath)
            return
        }
        deleteButton.backgroundColor = #colorLiteral(red: 1, green: 0.262745098, blue: 0.431372549, alpha: 1)
        return [deleteButton]
    }
    
}

extension TaskTableDataSourceDelegate: EmptyTableViewIndicatorDataSource {
    
    func viewForEmptyTableView(_ tableView: UITableView) -> UIView {
        return EmptyMessageImageView()
    }
    
}
