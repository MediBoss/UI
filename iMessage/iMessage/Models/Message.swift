//
//  Message.swift
//  iMessage
//
//  Created by Medi Assumani on 4/5/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

struct Message{
    
    let senderName: String
    let body: String
    let senderImage: UIImage?
    let timeStamp: String
    
    init(name: String, body: String, image: UIImage, time: String) {
        
        self.senderName = name
        self.body = body
        self.senderImage = image
        self.timeStamp = time
    }
}
