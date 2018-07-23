//
//  OutGoingImageTableViewCell.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class OutGoingImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var messageImageView: UIImageView!
    
    func bindDataFrom(_ message: Message){
        let userInfo = message.username + " - " + message.time
        userInfoLabel.text = userInfo
        messageImageView.image = UIImage(named: message.content)
    }
    
}
