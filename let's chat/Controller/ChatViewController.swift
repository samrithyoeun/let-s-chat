//
//  ConversationViewController.swift
//  let's chat
//
//  Created by PM Academy 3 on 7/23/18.
//  Copyright © 2018 PM Academy 3. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var letchatLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var onlineLabel: UILabel!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputButton: UIButton!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var stickerView: UIView!
    @IBOutlet weak var smileButton: UIButton!
    @IBOutlet weak var sadFaceButton: UIButton!
    @IBOutlet weak var supriseFaceButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var inputHolderView: UIView!
    @IBOutlet weak var inputViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var chatTableButtomConstriant: NSLayoutConstraint!
    
    lazy var labelGroup = [letchatLabel, channelLabel, ]
    
    var conversations = [Message]()
    var testSendingMessage  = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        conversations.append(Message(username: "Sam", time: "12:00pm", content: "Hello there what is the 1 ?", type: "message"))
        conversations.append(Message(username: "Sam", time: "12:00pm", content: "Hello there what is the 2 ?", type: "message"))
        conversations.append(Message(username: "Sam", time: "12:00pm", content: "Hello there what is the 3 ?", type: "message"))
        
        updateTableContentInset(forTableView: chatTableView)
        // TODO: hide the stickerbar , filter sender row in tablecell , calculate keyboard size 
    }
    
    @IBAction func keyboardButtonTapped(_ sender: Any) {
        inputViewBottomConstraint.constant += 50
        print(chatTableButtomConstriant.constant)
        updateTableContentInset(forTableView: chatTableView)
        scrollToBottom()
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        conversations.append(Message(username: "Sam", time: "\(testSendingMessage)" , content: "Hello there what is the 1 ?", type: "message"))
        chatTableView.reloadData()
        scrollToBottom()
    }
    private func updateTableContentInset(forTableView tv: UITableView) {
        let numSections = tv.numberOfSections
        var contentInsetTop = chatTableView.bounds.size.height
        
        
        for section in 0..<numSections {
            let numRows = tv.numberOfRows(inSection: section)
            let sectionHeaderHeight = tv.rectForHeader(inSection: section).size.height
            let sectionFooterHeight = tv.rectForFooter(inSection: section).size.height
            contentInsetTop -= sectionHeaderHeight + sectionFooterHeight
            for i in 0..<numRows {
                let rowHeight = tv.rectForRow(at: IndexPath(item: i, section: section)).size.height
                contentInsetTop -= rowHeight
                if contentInsetTop <= 0 {
                    contentInsetTop = 0
                    break
                }
            }
            if contentInsetTop == 0 {
                break
            }
        }
        tv.contentInset = UIEdgeInsetsMake(contentInsetTop, 0, 0, 0)
    }
    
    public func changeThemeTo(){
        
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.conversations.count-1, section: 0)
            self.chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "incomingMessage") as! InComingMessageTableViewCell
        let message = conversations[indexPath.row]
        cell.bindDataFrom(message)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        messageTextField.resignFirstResponder()
        view.endEditing(true)
        return true
    }
}

extension ChatViewController: ThemeManagerProtocol{
    func changeThemeTo(_ theme: Theme) {
        
    }
    
    
}
