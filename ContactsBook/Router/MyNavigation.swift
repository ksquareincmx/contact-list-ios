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
            case .addContact(let delegate):
                let sb = UIStoryboard(name: "AddContactStoryboard", bundle: nil)
                let navController = sb.instantiateViewController(withIdentifier: "AddContactNC") as! UINavigationController
                guard let addContactVC = navController.topViewController as? AddContactViewController else {
                    return UIViewController()
                }
                addContactVC.delegate = delegate
                return navController
            case .updateContact(let contact, let delegate):
                let sb = UIStoryboard(name: "AddContactStoryboard", bundle: nil)
                let navController = sb.instantiateViewController(withIdentifier: "AddContactNC") as! UINavigationController
                guard let addContactVC = navController.topViewController as? AddContactViewController else {
                    return UIViewController()
                }
                addContactVC.contact = contact
                addContactVC.delegate = delegate
                return navController
                
            case .contactDetail(let contact):
                let sb = UIStoryboard(name: "ContactDetailStoryboard", bundle: nil)
                guard let detailVC = sb.instantiateViewController(withIdentifier: "ContactDetailViewController") as? ContactDetailViewController else {
                    return UIViewController()
                }
                detailVC.contact = contact
                return detailVC
            }
        }
        return UIViewController()
    }
    
    func navigate(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
        if let navigation = navigation as? MyRouter {
            switch navigation {
            case .addContact, .updateContact:
                from.present(to, animated: true, completion: nil)
            case .contactDetail:
                from.navigationController?.pushViewController(to, animated: true)
            }
        }
    }
}

extension UIViewController {
    func navigate(_ navigation: MyRouter) {
        navigate(navigation as Navigation)
    }
}
