//
//  NotesTableViewController.swift
//  Simple Notes
//
//  Created by Abdurrahman on 3/4/16.
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Simple Notes"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath)
		
        return cell
    }
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

}
