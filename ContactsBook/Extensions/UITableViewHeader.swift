//
//  UITableViewHeader.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 14/10/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

extension UITableView {
    func setHeader(_ header: UIView, height: CGFloat = 150.0) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: height))
        
        header.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(header)
        
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        self.tableHeaderView = view
    }
}
