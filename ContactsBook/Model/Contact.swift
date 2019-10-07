//
//  Contact.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/4/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
}

class Contact: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var address: String = ""
    var location: Location? = nil
}
