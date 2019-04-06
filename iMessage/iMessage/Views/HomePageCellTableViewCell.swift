//
//  HomePageCellTableViewCell.swift
//  iMessage
//
//  Created by Medi Assumani on 4/5/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class HomePageCellTableViewCell: UITableViewCell {

    static let identifier = "cellID"
    
    lazy var senderLabel: UILabel = {
    
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 15)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var messageBodyPreviewLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Medium", size: 12)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var senderImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var lastTextSentDateLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Medium", size: 10)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        senderImageView.layer.masksToBounds = true
        senderImageView.layer.cornerRadius = 35
        mainAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func mainAutoLayout(){
        
        let cellLabelStackView = CustomStackView(subviews: [senderLabel, messageBodyPreviewLabel],
                                                 alignment: .center,
                                                 axis: .vertical,
                                                 distribution: .fillEqually)
        
        let outerStackView = CustomStackView(subviews: [senderImageView, cellLabelStackView, lastTextSentDateLabel],
                                             alignment: .center,
                                             axis: .horizontal,
                                             distribution: .fill)
        
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        cellLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(outerStackView)
        addSubview(cellLabelStackView)
        
        NSLayoutConstraint.activate([
           
            outerStackView.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: widthAnchor),
            outerStackView.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: heightAnchor),
            
            senderImageView.widthAnchor.constraint(equalTo: outerStackView.widthAnchor, multiplier: 0.2),
            senderImageView.heightAnchor.constraint(equalTo: outerStackView.heightAnchor, multiplier: 0.9),
            
            cellLabelStackView.widthAnchor.constraint(equalTo: outerStackView.widthAnchor, multiplier: 1.0),
            cellLabelStackView.heightAnchor.constraint(equalTo: outerStackView.heightAnchor, multiplier: 0.7),
            
            lastTextSentDateLabel.widthAnchor.constraint(equalTo: outerStackView.widthAnchor, multiplier: 0.2),
            lastTextSentDateLabel.heightAnchor.constraint(equalTo: outerStackView.heightAnchor, multiplier: 0.2),
            
            senderLabel.widthAnchor.constraint(equalTo: cellLabelStackView.widthAnchor, multiplier: 0.5),
            senderLabel.heightAnchor.constraint(equalTo: cellLabelStackView.heightAnchor, multiplier: 0.5),
            
            messageBodyPreviewLabel.widthAnchor.constraint(equalTo: cellLabelStackView.widthAnchor, multiplier: 0.5),
            messageBodyPreviewLabel.heightAnchor.constraint(equalTo: cellLabelStackView.heightAnchor, multiplier: 0.5)
        ])
    }
}
