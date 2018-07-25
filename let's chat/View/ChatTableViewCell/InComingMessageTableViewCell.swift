//
//  InComingMessageTableViewCell.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class InComingMessageTableViewCell: TemplateTableViewCell {

    @IBOutlet weak var senderInfoLabel: UILabel!
    @IBOutlet weak var senderMessageLabel: UILabel!
    
    func bindDataFrom(_ message: Message){
        let userInfo = message.username + " - " + message.time
        senderInfoLabel.text = userInfo
        senderMessageLabel.text = message.content
    }
}
