//
//  MenuController.swift
//  Twitter
//
//  Created by Medi Assumani on 8/23/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit


class MenuController: UIViewController{
    
    // MARK: PROPERTIES
    
    var tableView = UITableView()
    var cellID = "id"
    
    // MARK: INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    // MARK: HANDLERS
    
    func configureTableView(){
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension MenuController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        return cell
    }
    
    
}

class MenuTableViewCell: UITableViewCell {
    
}
