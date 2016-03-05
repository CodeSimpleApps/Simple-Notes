//
//  EditViewController.swift
//  Simple Notes
//
//  Created by Abdurrahman on 3/4/16.
//  Modified by Chirstopher Augg on 3/4/16 to add Core Data functionality
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var passedText: String!
    var index: Int!

	@IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var editNoteTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationItem.rightBarButtonItem = self.doneBarButtonItem
		editNoteTextView.text = passedText
		title = "Edit Notes"	}

	@IBAction func doneButtonClicked(sender: AnyObject) {
		if let str = editNoteTextView.text {
            
			CoreDataService.cds.updateNote(index, newNote: str)
            self.navigationController?.popToRootViewControllerAnimated(true)
            
		} else {
            
			showAlert("Error", message: "Please add some information", closeButton: "OK")
		}
	}
	
	func showAlert(title: String, message: String, closeButton: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
		alertController.addAction(UIAlertAction(title: closeButton, style: .Default, handler: nil))
		self.presentViewController(alertController, animated: true, completion: nil)
	}
	
}
