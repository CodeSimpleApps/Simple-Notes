//
//  CoreDataService.swift
//  Simple Notes
//
//  Created by Chris Augg on 3/4/16.
//  Copyright © 2016 CodeSimpleApps. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    static let cds = CoreDataService()    
    var notes = [NSManagedObject]()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
   
    
    func saveNote(name: String) {
        
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
    
    func updateNote(index:Int, newNote: String){
        
        notes[index].setValue(newNote, forKey: "text")
        appDelegate.saveContext()        
        
    }
    
    func deleteNote(noteObjToDelete: NSManagedObject) {
       
        let managedContext = appDelegate.managedObjectContext
        managedContext.deleteObject(noteObjToDelete)
        appDelegate.saveContext()
    }
    
    func loadNotes() {
        
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Note")
        
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            notes = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

    }

}
