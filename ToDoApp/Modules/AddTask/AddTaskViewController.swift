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

final class AddTaskViewController: UIViewController {

    //MARK:- View Reference
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var descriptionTextView: ExpandableTextView!
    
    //MARK:- variables
    var viewModel: AddTaskViewModel!
    weak var delegate: AddTaskViewControllerDelegate!
    
    //MARK:- view load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleTextField()
        setupDescriptionTextView()
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
extension AddTaskViewController: UITextFieldDelegate {
    
    func setupTitleTextField() {
        titleTextField.delegate = self
        titleTextField.addTarget(self, action: #selector(didChangeTitle), for: .editingChanged)
    }
    
    @objc func didChangeTitle(textField : UITextField) {
        viewModel.title = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            textField.resignFirstResponder()
            descriptionTextView.becomeFirstResponder()
        }
        return true
    }
    
}

//MARK:- TextView
extension AddTaskViewController: UITextViewDelegate {
    
    func setupDescriptionTextView() {
        descriptionTextView.delegate = self
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == descriptionTextView {
            descriptionTextView.placeholderLabel.isHidden = !textView.text.isEmpty
        }
        viewModel.description = textView.text
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard text != "\n" else {
            textView.resignFirstResponder()
            return false
        }
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 100
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
