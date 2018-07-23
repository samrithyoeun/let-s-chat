//
//  OutGoingMessageTableViewCell.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class OutGoingMessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    func bindDataFrom(_ message: Message){
        let userInfo = message.username + " - " + message.time
        userInfo.text = userInfo
        messageLabel.text = message.content
    }
    
}
