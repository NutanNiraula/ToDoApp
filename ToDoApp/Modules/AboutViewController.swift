//
//  AboutViewController.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var aboutDescriptionTextView: UITextView!
    
    var aboutDescription: String!
    
    @IBAction func onViewTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutDescriptionTextView.text = aboutDescription
    }

}
