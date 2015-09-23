//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var chillButton: UIButton!
    @IBOutlet var awkwardButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dislikeButton: UIButton!
    
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        returnButton.addTarget(self, action: "inputReturn", forControlEvents: .TouchUpInside)
        deleteButton.addTarget(self, action: "deleteText", forControlEvents: .TouchUpInside)
        chillButton.addTarget(self, action: "insertChillFace", forControlEvents: .TouchUpInside)
        awkwardButton.addTarget(self, action: "insertAwkwardFace", forControlEvents: .TouchUpInside)
        likeButton.addTarget(self, action: "insertThumbsUp", forControlEvents: .TouchUpInside)
        dislikeButton.addTarget(self, action: "insertThumbsDown", forControlEvents: .TouchUpInside)
    }
    
    func inputReturn() {
        super.textDocumentProxy.insertText("\n")
    }
    
    func deleteText() {
        super.textDocumentProxy.deleteBackward()
    }
    
    func insertChillFace() {
        super.textDocumentProxy.insertText("😎coolcoolcool")
    }
    
    func insertAwkwardFace() {
        super.textDocumentProxy.insertText("😰sorry")
    }
    
    func insertThumbsUp() {
        super.textDocumentProxy.insertText("👍Yes!")
    }
    
    func insertThumbsDown() {
        super.textDocumentProxy.insertText("👎Nah")
    }
    
    


}
