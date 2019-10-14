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
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var imageData: Data? = nil
    @objc dynamic var location: Location? = nil
    @objc dynamic var isFavorite = false
    var image: UIImage? {
        guard let data = self.imageData, let img = UIImage(data: data) else {
            return nil
        }
        return img
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
