//
//  AddContactViewController.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/4/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

protocol AddContactViewControllerDelegate: class {
    func didAddContact()
}

class AddContactViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var chooseLocationButton: UIButton!
    
    //MARK: - Properties
    var contact: Contact?
    lazy var myRealm = MyRealm()
    var delegate: AddContactViewControllerDelegate?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func chooseLocationButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func saveBarButtonAction(_ sender: UIBarButtonItem) {
        if let _ = contact {
            //Update contact
            
            
        } else {
            //Save new contact
            guard let name = self.nameTextField.text, let phone = self.phoneTextField.text, let address = self.addressTextField.text else {
                return
            }
            let newContact = Contact()
            newContact.name = name
            newContact.phone = phone
            newContact.address = address
            self.myRealm.write(newContact)
            self.dismiss(animated: true) {
                self.delegate?.didAddContact()
            }
        }
        
    }
    
    @IBAction func cancelBarButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
