//
//  ViewController.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameLineView: UIView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelButton: UIButton!
    @IBOutlet weak var channelLineView: UIView!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var channelDropDownImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ControllerManager.shared.login = self
        changeThemeTo(Theme.black)
    }
    
    @IBAction func joinButtontTapped(_ sender: UIButton) {
        ThemeManager.shared.switchTheme { (theme) in
            changeThemeTo(theme)
        }
        
    }
    
}

extension LoginViewController: ThemeManagerProtocol {
    func changeThemeTo(_ theme: Theme){
        ThemeManager.changeTo(theme) { (primaryColor, secondaryColor) in
            view.backgroundColor = primaryColor
            containerView.backgroundColor = primaryColor
            logoLabel.textColor = secondaryColor
            userImageView.tintColor = secondaryColor
            nameLabel.textColor = secondaryColor
            usernameLineView.backgroundColor = secondaryColor
            usernameTextField.textColor = secondaryColor
            usernameTextField.setPlaceHolderColor(secondaryColor)
            channelButton.titleLabel?.textColor = secondaryColor
            channelLineView.backgroundColor = secondaryColor
            channelLabel.textColor = secondaryColor
            channelButton.tintColor = secondaryColor
            channelButton.titleLabel?.textColor = secondaryColor
            channelButton.setTitleColor(secondaryColor, for: .normal)
            channelImageView.tintColor = secondaryColor
            channelDropDownImageView.tintColor = secondaryColor
            joinButton.backgroundColor = secondaryColor
            joinButton.setTitleColor(primaryColor, for: .normal)
        }
        
    }
}

