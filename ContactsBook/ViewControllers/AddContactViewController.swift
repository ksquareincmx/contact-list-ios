//
//  AddContactViewController.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/4/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var chooseLocationButton: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: - Actions
    @IBAction func chooseLocationButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func saveBarButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func cancelBarButtonAction(_ sender: UIBarButtonItem) {
        
    }
}
