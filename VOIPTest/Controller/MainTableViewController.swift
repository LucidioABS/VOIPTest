//
//  MainTableViewController.swift
//  Voip_test
//
//  Created by Lucídio Andrade Barbosa de Souza on 25/03/20.
//  Copyright © 2020 Lucídio Andrade Barbosa de Souza. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "VOIP TEST"
         Database.getAPI()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
         NotificationCenter.default.addObserver(self, selector: #selector(didGetAPIInformation), name: Database.didGetAPIInformationNN, object: nil)
       
    }
    
    @objc private func didGetAPIInformation() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
