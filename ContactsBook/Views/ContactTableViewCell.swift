//
//  ContactTableViewCell.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/3/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

protocol ContactTableViewCellDelegate: class {
    func contactCell(_ contactCell: ContactTableViewCell, didFav contact: Contact)
}

class ContactTableViewCell: UITableViewCell {
    //MARK: - UI
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var favImageView: FavoriteImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Properties
    var contact: Contact! {
        didSet {
            self.setupInfo()
        }
    }
    lazy var myRealm = MyRealm()
    var delegate: ContactTableViewCellDelegate?
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setup()
    }
    
    //MARK: - Setup
    private func setup() {
        self.favImageView.delegate = self
        DispatchQueue.main.async {
            self.photoImageView.circle()
        }
    }

    private func setupInfo() {
        self.nameLabel.text = self.contact.name
        self.phoneLabel.text = self.contact.phone
        self.photoImageView.image = self.contact.image ?? #imageLiteral(resourceName: "PhotoPlaceholder")
        self.favImageView.setFavoriteState(self.contact.isFavorite)
    }
}

extension ContactTableViewCell: FavoriteImageViewDelegate {
    func favoriteImageView(_ favImageView: FavoriteImageView, didTapped isFavorite: Bool) {
        self.myRealm.update {
            self.contact.isFavorite = isFavorite
        }
        self.delegate?.contactCell(self, didFav: self.contact)
    }
}
