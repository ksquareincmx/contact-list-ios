//
//  MyRouter.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/7/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

enum MyRouter: Navigation {
    case addContact(delegate: AddContactViewControllerDelegate?)
    case updateContact(_ contact: Contact, delegate: AddContactViewControllerDelegate?)
    case contactDetail(contact: Contact)
}
