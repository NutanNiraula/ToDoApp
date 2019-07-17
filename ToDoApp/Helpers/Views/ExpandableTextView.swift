//
//  ExpandableTextView.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

class ExpandableTextView: UITextView {
    
    var placeholderLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        expandTextViewWithContent()
        setPlaceHolder()
        styleView()
    }
    
    func styleView() {
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
    }
    
    func expandTextViewWithContent() {
        //lower height constraint priority to low
        textContainer.heightTracksTextView = true
        isScrollEnabled = false
    }
    
    func setPlaceHolder() {
        textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        placeholderLabel = UILabel()
        placeholderLabel.text = "Description (100 characters)"
        placeholderLabel.font = UIFont.systemFont(ofSize: 14)
        placeholderLabel.sizeToFit()
        addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 8, y: 10)
        placeholderLabel.textColor = UIColor.lightGray.withAlphaComponent(0.75)
        placeholderLabel.isHidden = !text.isEmpty
    }
    
}

