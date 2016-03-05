//
//  AddViewController.swift
//  Simple Notes
//
//  Created by Abdurrahman on 3/4/16.
//  Modified by Chirstopher Augg on 3/4/16 to add Core Data functionality
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

	@IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var addNoteTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationItem.rightBarButtonItem = self.doneBarButtonItem
		title = "Add Note"
	}

	@IBAction func donePressed(sender: AnyObject) {
		if addNoteTextView.text != "" {
			// Save the new note
			// also make the navigation pop back
            
            if let note = addNoteTextView.text {
                CoreDataService.cds.saveNote(note)
            }
            
			self.navigationController?.popToRootViewControllerAnimated(true)
		} else {
			showAlert("Error", message: "Please provide some data", closeButton: "OK")
		}
	}
	
	func showAlert(title: String, message: String, closeButton: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
		alertController.addAction(UIAlertAction(title: closeButton, style: .Default, handler: nil))
		self.presentViewController(alertController, animated: true, completion: nil)
	}	

}
