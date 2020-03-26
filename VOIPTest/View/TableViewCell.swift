//
//  TableViewCell.swift
//  Voip_test
//
//  Created by Lucídio Andrade Barbosa de Souza on 25/03/20.
//  Copyright © 2020 Lucídio Andrade Barbosa de Souza. All rights reserved.
//

import Foundation
import UIKit


class TableViewCell: UITableViewCell {
    
    private weak var profile: Profile?
    
    
    let smallImageview: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let albumID: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let id: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(smallImageview)
        addSubview(title)
        addSubview(albumID)
        addSubview(id)
        
        
        smallImageview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        smallImageview.widthAnchor.constraint(equalToConstant: 150).isActive = true
        smallImageview.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        smallImageview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
        title.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        title.topAnchor.constraint(equalTo: smallImageview.bottomAnchor).isActive = true
                
        id.heightAnchor.constraint(equalToConstant: 30).isActive = true
        id.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        id.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        id.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        
        albumID.heightAnchor.constraint(equalToConstant: 30).isActive = true
        albumID.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        albumID.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        albumID.topAnchor.constraint(equalTo: id.bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(with profile: Profile) {
        self.profile = profile
        smallImageview.image = profile.thumbnailImage
        id.text = "ID: \(profile.id)"
        title.text = profile.title
        
        if smallImageview.image == nil {
            NotificationCenter.default.addObserver(self, selector: #selector(thumbnailImageDidDownloaded), name: Profile.thumbnailImageDownloadedNN, object: profile)
        }
    }
    
    @objc private func thumbnailImageDidDownloaded() {
        DispatchQueue.main.async {
            self.smallImageview.image = self.profile?.thumbnailImage
        }
    }
}


