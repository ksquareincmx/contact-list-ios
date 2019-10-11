//
//  ContactDetailViewController.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/10/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var detailTableView: UITableView!
    var editBarButton: UIBarButtonItem!
    
    //MARK: - Properties
    var contact: Contact!
    let sections = ["Name", "Phone number", "Address"]
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    //MARK: - Setup
    private func setup() {
        self.setupTableView()
        self.setupEditBarButton()
    }
    
    private func setupTableView() {
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupEditBarButton() {
        self.editBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editBarButtonAction))

        self.navigationItem.rightBarButtonItem = self.editBarButton
    }
    
    //MARK: - Actions
    @objc func editBarButtonAction() {
        self.navigate(.updateContact(self.contact, delegate: self))
    }
}
//MARK: - Extension TableView
extension ContactDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = self.contact.name
        case 1:
            cell.textLabel?.text = self.contact.phone
        case 2:
            cell.textLabel?.text = self.contact.address
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Extension
extension ContactDetailViewController: AddContactViewControllerDelegate {
    func didEditContact() {
        print("Did edit contact")
    }
    
    func didAddContact() {
        
    }
}
