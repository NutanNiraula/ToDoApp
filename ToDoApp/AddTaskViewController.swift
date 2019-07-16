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

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    @IBAction func onVisualEffectViewTapped(_ sender: Any) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onAddButtonTapped(_ sender: Any) {
        delegate.didSetTask(task: viewModel.getTaskModel())
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onViewTapped(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    var viewModel: AddTaskViewModel!
    weak var delegate: AddTaskViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        observeFormValidity()
    }
    
    private func observeFormValidity() {
        viewModel.validityObserver = { [unowned self] isValidForm in
            self.addButton.alpha = isValidForm ? 1 : 0.5
            self.addButton.isUserInteractionEnabled = isValidForm
        }
    }
    
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

