//
//  MyNavigation.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/7/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation
import UIKit
struct MyNavigation: AppNavigation {
    func viewcontrollerForNavigation(navigation: Navigation) -> UIViewController {
        if let navigation = navigation as? MyRouter {
            switch navigation {
            case .addContact:
                break
            case .updateContact(_):
                break
            }
        }
        return UIViewController()
    }
    
    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
        
    }
}
