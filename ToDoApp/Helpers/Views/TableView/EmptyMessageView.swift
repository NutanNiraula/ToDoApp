//
//  EmptyMessageView.swift
//  CustomViews
//
//  Created by Nutan Niraula on 1/7/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

class EmptyMessageImageView: UIView {
    
    private var emptyImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func configureView() {
        emptyImageView = UIImageView()
        emptyImageView.contentMode = .scaleAspectFit
        emptyImageView.image = #imageLiteral(resourceName: "NoTasksWarning.pdf")
        addSubview(emptyImageView)
        emptyImageView.translatesAutoresizingMaskIntoConstraints = false
        emptyImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        emptyImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        emptyImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
}
