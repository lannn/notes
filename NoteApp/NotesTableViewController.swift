//
//  NotesTableViewController.swift
//  NoteApp
//
//  Created by Lan Nguyen on 11/22/14.
//  Copyright (c) 2014 Lan Nguyen. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    var notes:NSArray
    
    required init(coder aDecoder: NSCoder) {
        notes = ["one", "two", "three", "four", "five"]
        
        super.init(coder: aDecoder)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell") as UITableViewCell
        cell.textLabel.text = notes[indexPath.row] as NSString
        return cell
    }
}
