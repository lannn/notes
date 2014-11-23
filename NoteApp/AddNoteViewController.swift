//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Lan Nguyen on 11/23/14.
//  Copyright (c) 2014 Lan Nguyen. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var newNoteTextField:UITextField?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        
        return true
    }
    
    @IBAction func closeAddNote(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
