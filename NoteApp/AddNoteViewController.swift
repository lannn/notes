//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Lan Nguyen on 11/23/14.
//  Copyright (c) 2014 Lan Nguyen. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
  func saveNote(controller: AddNoteViewController, noteText: String)
}

class AddNoteViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet var newNoteTextField:UITextField?
  var delegate: AddNoteViewControllerDelegate?
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    delegate?.saveNote(self, noteText: textField.text)
    
    return true
  }
  
  @IBAction func closeAddNote(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
}
