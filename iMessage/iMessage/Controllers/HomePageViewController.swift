//
//  HomePageViewController.swift
//  iMessage
//
//  Created by Medi Assumani on 4/5/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var mainTableView: UITableView = {
        
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var messages = [

        Message(name: "Mace", body: "Why'd you pause me?", image: UIImage(named: "mace")!, time: "12:58 PM"),
        Message(name: "Yves", body: "Approve my PR.", image: UIImage(named: "yves")!, time: "3/15/19"),
        Message(name: "Wenzel L", body: "What's a div?", image: UIImage(named: "wenzel")!, time: "12:58 PM"),
        Message(name: "T'shalla", body: "Do the arm thingy pls", image: UIImage(named: "tshalla")!, time: "01:20 PM"),
        Message(name: "Marck Zucc", body: "Gimme a job pls", image: UIImage(named: "mark")!, time: "03:12 PM"),
        Message(name: "Big AL", body: "No.", image: UIImage(named: "alirie")!, time: "12/03/2012"),
        Message(name: "Josh", body: "Yerrrrr", image: UIImage(named: "josh")!, time: "12:58 PM"),
        Message(name: "Vicenzo", body: "Im swole af boiiii", image: UIImage(named: "vicenzo")!, time: "12:58 PM"),
        Message(name: "MediBoss", body: "It's me, your alter ego", image: UIImage(named: "medi")!, time: "12:58 PM")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(HomePageCellTableViewCell.self, forCellReuseIdentifier: HomePageCellTableViewCell.identifier)
        
        setUpNavigationBarItems()
        mainAutoLayout()
        view.backgroundColor = .white
    }
    
    private func setUpNavigationBarItems(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        titleLabel.text = "Messages"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 35)
        titleLabel.textAlignment = .left
        titleLabel.adjustsFontSizeToFitWidth = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.alpha = 1.0
    }
    
    
    func mainAutoLayout(){
        
        view.addSubview(mainTableView)
        NSLayoutConstraint.activate([
            mainTableView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTableView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: HomePageCellTableViewCell.identifier, for: indexPath) as! HomePageCellTableViewCell
        
        var currentMessage = messages[indexPath.row]
        cell.senderLabel.text = currentMessage.senderName
        cell.messageBodyPreviewLabel.text = currentMessage.body
        cell.lastTextSentDateLabel.text = currentMessage.timeStamp
        cell.senderImageView.image = currentMessage.senderImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }
}
