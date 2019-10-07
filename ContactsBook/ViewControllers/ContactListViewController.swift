//
//  ViewController.swift
//  ContactsBook
//
//  Created by Abraham Escamilla Pinelo on 10/3/19.
//  Copyright © 2019 Abraham Escamilla Pinelo. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var contactsTableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    //MARK: - Setup
    private func setupTableView() {
        self.contactsTableView.dataSource = self
        self.contactsTableView.delegate = self
        let cellIdentifier = String(describing: ContactTableViewCell.self)
        self.contactsTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.contactsTableView.rowHeight = 110
    }
    
    //MARK: - Actions
    @IBAction func addContactBarButtonItemAction(_ sender: UIBarButtonItem)
    {
        navigate(.addContact)
    }
}

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactTableViewCell.self), for: indexPath) as! ContactTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

