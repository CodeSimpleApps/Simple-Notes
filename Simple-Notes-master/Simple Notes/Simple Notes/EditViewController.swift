//
//  EditViewController.swift
//  Simple Notes
//
//  Created by Abdurrahman on 3/4/16.
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

	@IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var editNoteTextView: UITextView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationItem.rightBarButtonItem = self.doneBarButtonItem
		
		
	}

	@IBAction func doneButtonClicked(sender: AnyObject) {
		if editNoteTextView.text != "" {
			// Start Saving
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
