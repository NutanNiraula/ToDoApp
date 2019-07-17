//
//  ViewController.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/15/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

final class TasksViewController: UIViewController {

    @IBOutlet var taskTableView: EmptyIndicatingTableView!
    @IBOutlet var addTaskButton: UIButton!
    @IBOutlet var aboutButton: UIBarButtonItem!
    @IBOutlet var syncButton: UIBarButtonItem!
    
    lazy var taskTableDataSourceDelegate: TaskTableDataSourceDelegate = {
        return TaskTableDataSourceDelegate(forTableView: self.taskTableView)
    }()
    
    var viewModel: TasksViewModel!
    
    @IBAction func onAddTaskBtnTapped(_ sender: Any) {
        let addTaskVC = ViewRepo.getAddTasksVC()
        addTaskVC.delegate = self
        self.present(addTaskVC, animated: true, completion: nil)
    }
    
    @IBAction func onAboutButtonTapped(_ sender: Any) {
        viewModel.getAboutData()
    }
    
    @IBAction func onSyncButtonTapped(_ sender: Any) {
        viewModel.syncToDoList()
    }
    
    var activityIndicator = UIActivityIndicatorView()
    
    func startLoadingSpinner() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        activityIndicator.color = .white
        let barButton = UIBarButtonItem(customView: activityIndicator)
        self.navigationItem.setLeftBarButton(barButton, animated: true)
        activityIndicator.startAnimating()
    }
    
    func stopLoadingSpinner() {
        activityIndicator.stopAnimating()
        navigationItem.setLeftBarButton(aboutButton, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTasksTableView()
        observeAboutInfoMessage()
        observeIsLoadingState()
        observeErrorMessage()
    }
    
    private func observeErrorMessage() {
        viewModel.errorObserver = { [unowned self] errorMessage in
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func observeIsLoadingState() {
        viewModel.isLoadingDataObserver = { [unowned self] isLoading in
            isLoading ? self.startLoadingSpinner() : self.stopLoadingSpinner()
        }
    }
    
    private func observeAboutInfoMessage() {
        viewModel.aboutInfoObserver = { [unowned self] aboutInfo in
            let aboutVC = ViewRepo.getAboutVC(withInfo: aboutInfo)
            self.present(aboutVC, animated: true, completion: nil)
        }
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
        viewModel.save(toDoList: taskTableDataSourceDelegate.model)
    }
    
}
