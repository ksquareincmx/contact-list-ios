//
//  UIImageViewCircle.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/10/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

extension UIImageView {
    func circle() {
        self.layer.cornerRadius = self.layer.bounds.width / 2
    }
}
