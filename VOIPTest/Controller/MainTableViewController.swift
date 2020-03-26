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
    let detailViewController = DetailViewController()

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

extension MainTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let albumCount = Database.profiles.last?.albumId {
            return albumCount
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Database.profiles.filter({$0.albumId == section + 1}).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TableViewCell
        let album = Database.profiles.filter({$0.albumId == indexPath.section + 1})
        cell.fill(with: album[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = Database.profiles.filter({$0.albumId == indexPath.section + 1})
        detailViewController.profile = album[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Album \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
}

