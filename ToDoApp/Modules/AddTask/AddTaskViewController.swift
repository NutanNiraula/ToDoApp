//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

protocol AddTaskViewControllerDelegate: class {
    func didSetTask(task: TaskModel)
}

class AddTaskViewController: UIViewController {

    //MARK:- View Reference
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    //MARK:- variables
    var viewModel: AddTaskViewModel!
    weak var delegate: AddTaskViewControllerDelegate!
    
    //MARK:- view load
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        observeFormValidity()
    }
    
    private func observeFormValidity() {
        viewModel.validityObserver = { [unowned self] isValidForm in
            self.addButton.setEnabled(state: isValidForm)
        }
    }
    
    //MARK:- Actions
    @IBAction func onVisualEffectViewTapped(_ sender: Any) {
        hideKeyboard()
        dismissView()
    }
    
    @IBAction func onAddButtonTapped(_ sender: Any) {
        delegate.didSetTask(task: viewModel.getTaskModel())
        hideKeyboard()
        dismissView()
    }
    
    @IBAction func onViewTapped(_ sender: Any) {
        hideKeyboard()
    }
    
}

//MARK:- TextField
extension AddTaskViewController {
    
    func setTextFieldDelegates() {
        titleTextField.addTarget(self, action: #selector(didChangeTitle), for: .editingChanged)
        descriptionTextField.addTarget(self, action: #selector(didChangeDescription), for: .editingChanged)
    }
    
    @objc func didChangeTitle(textField : UITextField) {
        viewModel.title = textField.text
    }
    
    @objc func didChangeDescription(textField : UITextField) {
        viewModel.description = textField.text
    }
    
}

//MARK:- Utilities
extension AddTaskViewController {
    
    private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
