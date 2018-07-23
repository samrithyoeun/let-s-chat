//
//  SettingViewController.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var soundButton: UIButton!
    
    var buttonImage = "checked-white"
    var soundButtonTrigger = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: do something
        // dark theme
        //  selection style in theme table
        
        
    }
    
    @IBAction func soundButtonTapped(_ sender: UIButton) {
        
        soundButton.setImage(UIImage(named: buttonImage), for: .normal
        )
    }
}
