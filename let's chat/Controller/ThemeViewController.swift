//
//  ThemeViewController.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/24/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class ThemeViewController: UITableViewController {

    @IBOutlet weak var darkThemeImageView: UIImageView!
    @IBOutlet weak var whiteThemeImageView: UIImageView!
    @IBOutlet weak var minnionThemeImageView: UIImageView!
    
    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var primaryDarkLabel: UILabel!
    @IBOutlet weak var secondaryDarkLabel: UILabel!
    @IBOutlet weak var whiteLabel: UILabel!
    @IBOutlet weak var whitePrimaryLabel: UILabel!
    @IBOutlet weak var whiteSecondaryLabel: UILabel!
    @IBOutlet weak var minonLabel: UILabel!
    @IBOutlet weak var primaryMinionLabel: UILabel!
    @IBOutlet weak var secondaryMinnionLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellViewTwo: UIView!
    @IBOutlet weak var cellViewThree: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lineHeaderView: UIView!
    
    
    lazy var buttonGroup = [themeButton, saveButton]
    lazy var checkBoxGroup = [darkThemeImageView, whiteThemeImageView, minnionThemeImageView]
    lazy var labelGroup = [darkLabel, primaryDarkLabel, secondaryDarkLabel, whiteLabel, whitePrimaryLabel, whiteSecondaryLabel, minonLabel, primaryMinionLabel, secondaryMinnionLabel]
    lazy var celLViewGroup = [cellView, cellViewThree, cellViewTwo,headerView,view]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = true

    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        ThemeManager.shared.switchTheme { (theme) in
            changeThemeTo(theme)
        }
    }
    
    private func setCheckBox(index: IndexPath){
        let row = index.row
        
        for checkbox in checkBoxGroup {
            checkbox?.isHidden = true
        }
        
        checkBoxGroup[row]?.isHidden = false
    }
}

extension ThemeViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        setCheckBox(index: indexPath)
    }
}

extension ThemeViewController: ThemeManagerProtocol {
    func changeThemeTo(_ theme: Theme) {
        ThemeManager.changeTo(theme) { (firstColor, secondColor) in
            for mView in celLViewGroup {
                mView?.backgroundColor = firstColor
            }
            
            for button in buttonGroup {
                button?.setTitleColor(secondColor, for: .normal)
            }
            themeButton.imageView?.tintColor = secondColor
            
            for checkbox in checkBoxGroup {
                checkbox?.tintColor = secondColor
            }
            
            for label in labelGroup {
                label?.textColor = secondColor
            }
            
            lineHeaderView.backgroundColor = secondColor
            
        }
    }
    
    
}
