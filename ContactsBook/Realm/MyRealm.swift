//
//  MyRealm.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/7/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import Foundation
import RealmSwift

class MyRealm {
    let shared = try! Realm()
    
    func write(_ object: Object) {
        try! self.shared.write {
            self.shared.add(object)
        }
    }
    
    func write<S>(_ objects: S) where S: Sequence, S.Element: Object {
        try! self.shared.write {
            self.shared.add(objects)
        }
    }
    
    func update(_ transaction: () -> Void) {
        try! self.shared.write {
            transaction()
        }
    }
    
    func delete(_ object: Object) {
        try! self.shared.write {
            self.shared.delete(object)
        }
    }
    
    func delete<S>(_ objects: S) where S: Sequence, S.Element: Object {
        try! self.shared.write {
            self.shared.delete(objects)
        }
    }
}
