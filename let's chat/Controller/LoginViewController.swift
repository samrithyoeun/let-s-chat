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
    
    lazy var imageViewGroup = [userImageView, channelImageView, channelDropDownImageView]
    lazy var viewGroup = [usernameLineView, channelLineView]
    lazy var labelGroup = [logoLabel, nameLabel, channelLabel]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ControllerManager.shared.login = self
        changeThemeTo(Theme.black)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let theme = ThemeManager.shared.getTheme()
        changeThemeTo(theme)
    }
    
    @IBAction func joinButtontTapped(_ sender: UIButton) {
        //TODO : Handle join button and username redundance
        
    }
    
    private func goToChatScreen(){
        
    }
}

extension LoginViewController: ThemeManagerProtocol {
    func changeThemeTo(_ theme: Theme){
        ThemeManager.changeTo(theme) { (primaryColor, secondaryColor) in
            for mView in viewGroup {
                mView?.backgroundColor = secondaryColor
            }
            
            containerView.backgroundColor = primaryColor
            view.backgroundColor = primaryColor
            
            for label in labelGroup {
                label?.textColor = secondaryColor
            }
            
            for image in imageViewGroup {
                image?.tintColor = secondaryColor
            }
            
            usernameTextField.textColor = secondaryColor
            usernameTextField.setPlaceHolderColor(secondaryColor)
            
            channelButton.setTitleColor(secondaryColor, for: .normal)
            
            joinButton.backgroundColor = secondaryColor
            joinButton.setTitleColor(primaryColor, for: .normal)
        }
        
    }
}

