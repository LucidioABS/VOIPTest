//
//  DetailViewController.swift
//  Voip_test
//
//  Created by Lucídio Andrade Barbosa de Souza on 26/03/20.
//  Copyright © 2020 Lucídio Andrade Barbosa de Souza. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    weak var profile: Profile?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailView.imageView.image = profile?.photoImage
        if detailView.imageView.image == nil {
            NotificationCenter.default.addObserver(self, selector: #selector(photoImageDidDownloaded), name: Profile.photoImageDownloadedNN, object: profile)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        detailView.imageView.image = nil
        NotificationCenter.default.removeObserver(self)
    }
    
    private var detailView: DetailView {
        return self.view as! DetailView
    }
    
    @objc private func photoImageDidDownloaded() {
        DispatchQueue.main.async {
            self.detailView.imageView.image = self.profile?.photoImage
        }
    }
    
    private func initView() {
        self.view = DetailView()
    }
}

