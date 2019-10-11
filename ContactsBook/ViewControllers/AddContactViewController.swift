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
    func didEditContact()
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
    lazy var imagePicker: ImagePicker = {
        let picker = ImagePicker(presentationController: self, delegate: self)
        return picker
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    //MARK: - Setup
    private func setup() {
        self.setupPhotoImageView()
        self.setupPhoneTextField()
        self.setupInfo()
    }
    
    private func setupPhotoImageView() {
        self.photoImageView.tappable = true
        self.photoImageView.circle()
        self.photoImageView.callback = {
            [weak self] in
            guard let self = self else {return}
            self.imagePicker.present(from: self.view)
        }
    }
    
    private func setupPhoneTextField() {
        self.phoneTextField.keyboardType = .phonePad
    }
    
    private func setupInfo() {
        if let contact = contact {
            self.photoImageView.image = contact.image ?? UIImage(named: "PhotoPlaceholder")
            self.phoneTextField.text = contact.phone
            self.addressTextField.text = contact.address
            self.nameTextField.text = contact.name
        }
    }
    
    //MARK: - Actions
    @IBAction func chooseLocationButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func saveBarButtonAction(_ sender: UIBarButtonItem) {
        if let _ = contact {
            //Update contact
            
            self.dismiss(animated: true) {
                [weak self] in
                guard let self = self else {return}
                self.delegate?.didEditContact()
            }
        } else {
            //Save new contact
            guard let name = self.nameTextField.text, let phone = self.phoneTextField.text, let address = self.addressTextField.text else {
                return
            }
            let newContact = Contact()
            newContact.name = name
            newContact.phone = phone
            newContact.address = address
            newContact.imageData = self.photoImageView.image?.pngData()
            self.myRealm.write(newContact)
            self.dismiss(animated: true) {
                [weak self] in
                guard let self = self else {return}
                self.delegate?.didAddContact()
            }
        }
    }
    
    @IBAction func cancelBarButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Extension ImagePickerDelegate
extension AddContactViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.photoImageView.image = image
    }
}
