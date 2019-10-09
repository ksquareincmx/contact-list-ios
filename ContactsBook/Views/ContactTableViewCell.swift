//
//  ContactTableViewCell.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/3/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var favImageView: FavoriteImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var contact: Contact! {
        didSet {
            self.setupInfo()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    private func setupInfo() {
        self.nameLabel.text = self.contact.name
        self.phoneLabel.text = self.contact.phone
    }
}
