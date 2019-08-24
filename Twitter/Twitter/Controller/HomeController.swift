//
//  HomeController.swift
//  Twitter
//
//  Created by Medi Assumani on 8/23/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit


class HomeController: UIViewController{
    
    // MARK: PROPERTIES
    var delegate: HomeControllerDelegate?
    // MARK: INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    
    // MARK: HANDLERS
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
    }
}
