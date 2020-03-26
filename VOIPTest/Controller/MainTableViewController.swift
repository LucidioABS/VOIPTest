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
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
            cell.setPhotoCellWith()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/2  
    }
    
    


}
