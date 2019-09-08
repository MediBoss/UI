//
//  MenuTableViewCell.swift
//  Twitter
//
//  Created by Medi Assumani on 9/8/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell {
    
    // MARK: PROPERTIES
        static let cellID = "MenuTableViewCellID"
    
    var itemNameLabel: UILabel = {
        
        let label = UILabel(text: "Home", font: .systemFont(ofSize: 18))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var itemImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutCellElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: HANDLERS

    private func layoutCellElements(){
        
        let stackView = UIStackView(arrangedSubviews: [itemImageView, itemNameLabel])
        
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 18
        
        itemImageView.constrainWidth(constant: 30)
        itemImageView.constrainHeight(constant: 30)
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
}

