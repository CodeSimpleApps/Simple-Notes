//
//  NotesTableViewController.swift
//  Simple Notes
//
//  Created by Abdurrahman on 3/4/16.
//  Modified by Chirstopher Augg on 3/4/16 to add Core Data functionality
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
    @IBOutlet weak var tableView: UITableView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
		
		title = "Simple Notes"
        
        self.tableView.reloadData()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        CoreDataService.cds.loadNotes()
        self.tableView.reloadData() 
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataService.cds.notes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
        
        
        let managedObj = CoreDataService.cds.notes[indexPath.row]
        
        if let note = managedObj.valueForKey("text") as? String {
            
            cell.textLabel?.text = note
        }

        
        return cell
    }
    
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            if segue.identifier == "editVC" {               
        
                let vc = segue.destinationViewController as! EditViewController
               
                if let obj = sender {
                    
                    let cell = obj as! UITableViewCell
                    
                    if let str = cell.textLabel?.text {
                        
                        if let indexPath  = self.tableView.indexPathForSelectedRow {
                            
                            vc.index = indexPath.row
                        }
                        
                        vc.passedText = str
                    }                    
                }
             }
         }
}
