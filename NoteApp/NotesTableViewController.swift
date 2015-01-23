//
//  NotesTableViewController.swift
//  NoteApp
//
//  Created by Lan Nguyen on 11/22/14.
//  Copyright (c) 2014 Lan Nguyen. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, AddNoteViewControllerDelegate {
  
  var notes:NSArray
  var session:NSURLSession
  
  required init(coder aDecoder: NSCoder) {
    notes = []
    session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    super.init(coder: aDecoder)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    loadNotes()
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("noteCell") as UITableViewCell
    cell.textLabel!.text = notes[indexPath.row] as NSString
    return cell
  }
  
  func saveNote(controller: AddNoteViewController, noteText: String) {
    dismissViewControllerAnimated(true, completion: nil)
    
    var mutableNotes = NSMutableArray(array: notes)
    mutableNotes.addObject(noteText)
    notes = NSArray(array: mutableNotes)
    
    tableView.reloadData()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if(segue.identifier == "ShowAddNote") {
      let addNoteViewController = segue.destinationViewController as AddNoteViewController
      addNoteViewController.delegate = self
    }
  }
  
  func loadNotes() -> Void {
    let requestURL = NSMutableURLRequest(URL: NSURL(string: "http://localhost:3000/notes.json")!)
    let getNotesTask = session.dataTaskWithRequest(requestURL, completionHandler: { (responseData, response, error) -> Void in
      var readJSONError: NSError?
      let noteTextJSONData = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments, error: &readJSONError) as NSArray
      
      if let err = readJSONError {
        println(err.localizedDescription)
      } else {
        let mutableArray = NSMutableArray()
        for note in noteTextJSONData {
          mutableArray.addObject(note["name"] as NSString)
        }
      
        self.notes = mutableArray.copy() as NSArray
      }
      
      self.tableView.reloadData()
    })
    getNotesTask.resume()
  }
  
}
