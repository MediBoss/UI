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
    var topViewCard = UIView()
    
    var items: [MenuItem] = [
        
        MenuItem(name: "Profile", image: UIImage(named: "avatar")!),
        MenuItem(name: "Lists", image: UIImage(named: "avatar")!),
        MenuItem(name: "Bookmarks", image: UIImage(named: "avatar")!),
        MenuItem(name: "Moments", image: UIImage(named: "avatar")!),
        MenuItem(name: "Settings and Privacy", image: UIImage(named: "avatar")!),
        MenuItem(name: "Help Center", image: UIImage(named: "avatar")!)
    ]
    
    // MARK: INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureTableView()

    }
    // MARK: HANDLERS
    
    func configureTableView(){
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.fillSuperview()
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.cellID)
        
    }
    
}

extension MenuController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.cellID, for: indexPath) as! MenuTableViewCell
        
        let currentItem = items[indexPath.row]
        cell.itemNameLabel.text = currentItem.name
        cell.itemImageView.image = currentItem.image
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
    }
}

