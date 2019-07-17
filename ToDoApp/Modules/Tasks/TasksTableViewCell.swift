//
//  TasksTableViewCell.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

final class TasksTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var model: TaskModel! {
        didSet {
            titleLabel.text = model.title
            descriptionLabel.text = model.description
            dateLabel.text = model.dateAddedString
        }
    }

}
