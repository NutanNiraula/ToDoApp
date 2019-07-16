//
//  CustomTableView.swift
//  CustomViews
//
//  Created by Nutan Niraula on 1/4/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

protocol EmptyTableViewIndicatorDataSource: class {
    func viewForEmptyTableView(_ tableView: UITableView) -> UIView
}

class EmptyIndicatingTableView: UITableView {
    
    weak var emptyTableViewDataSource: EmptyTableViewIndicatorDataSource? {
        didSet {
            guard let dataSource = emptyTableViewDataSource else {
                print("data source is nil")
                return
            }
            
            addEmptyView(withView: dataSource.viewForEmptyTableView(self))
            handleEmptyTableView()
        }
    }
    
    private var customView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTableView()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    private func setupTableView() {
        if tableFooterView == nil {
            tableFooterView = UIView(frame: CGRect.zero)
        }
    }
    
    private func addEmptyView(withView view: UIView) {
        if customView != nil { customView.removeFromSuperview() }
        customView = view
        customView.alpha = 0
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func handleEmptyTableView() {
        if tableViewHasSections() {
            animateViewVisibility(isVisible: isFalse(tableViewHasRows()))
        } else {
            animateViewVisibility(isVisible: true)
        }
    }
    
    private func tableViewHasRows() -> Bool {
        for section in 0...numberOfSections - 1 {
            if numberOfRows(inSection: section) > 0 {
                return true
            }
        }
        return false
    }
    
    private func tableViewHasSections() -> Bool {
        return numberOfSections > 0
    }
    
    private func animateViewVisibility(isVisible visibility: Bool) {
        UIView.animate(withDuration: 0.1) { [weak self] in
            if let emptyMessageView = self?.customView {
                emptyMessageView.alpha = visibility ? 1 : 0
//                self?.isScrollEnabled = !visibility
            }
        }
    }
    
    func isFalse(_ bool: Bool) -> Bool {
        return bool == false
    }
    
}

//MARK: - TableView events overrides
extension EmptyIndicatingTableView {
    
    override func reloadData() {
        super.reloadData()
        handleEmptyTableView()
    }
    
    override func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        super.deleteRows(at: indexPaths, with: animation)
        handleEmptyTableView()
    }
    
    override func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        super.insertRows(at: indexPaths, with: animation)
        handleEmptyTableView()
    }
    
}
