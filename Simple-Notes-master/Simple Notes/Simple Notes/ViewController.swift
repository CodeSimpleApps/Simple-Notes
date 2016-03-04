//
//  ViewController.swift
//  Simple Notes
//
//  Created by Abdurrahman on 3/3/16. Modified by Christopher Augg to implement
//  CoreData with test code.
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import UIKit
import CoreData

var notes = [NSManagedObject]()

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
        
        if !notes.isEmpty {
            
            printNotes()
            
        } else {
            
            saveNote("CoreData")
            saveNote("is")
            saveNote("Ready!")
            
            printNotes()
        }
	}

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Note")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            notes = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    func saveNote(name: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Note", inManagedObjectContext:managedContext)
        
        let note = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        note.setValue(name, forKey: "text")
        
        do {
            try managedContext.save()
            
            notes.append(note)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func printNotes() {
        
        for note in notes {
            
            if let aNote = note.valueForKey("text") as? String {
                
                print(aNote)
            }
            
        }
        
    }


}

