//
//  Contact.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/4/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation

struct Location {
    var latitude: Double
    var longitude: Double
}

struct Contact {
    var name: String
    var phone: String
    var address: String
    var location: Location
}
