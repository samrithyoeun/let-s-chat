//
//  InComingImageTableViewCell.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class InComingImageTableViewCell: UITableViewCell {

    @IBOutlet weak var senderInfoLabel: UILabel!
    @IBOutlet weak var senderImageView: UIImageView!
    
    func bindDataFrom(_ message: Message){
        let userInfo = message.username + " - " + message.time
        senderInfoLabel.text = userInfo
        senderImageView.image = UIImage(named: message.content)
    }
}
