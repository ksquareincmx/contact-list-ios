//
//  MyRouter.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/7/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

enum MyRouter: Navigation {
    case addContact
    case updateContact(_ contact: Contact)
}
