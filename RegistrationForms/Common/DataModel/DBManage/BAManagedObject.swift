//
//  BAManagedObject.swift
//  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class BAManagedObject: NSManagedObject {

    static let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    class func saveContext()  {
        appDelegate.saveContext()
    }
    
    class func fetchAll(FromEntity entityName:String) -> [BAManagedObject]?
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : entityName)
        var managedObjects : [BAManagedObject]? = [BAManagedObject]()
        do
        {
            managedObjects = try  self.getContext().fetch(fetchRequest) as? [BAManagedObject]
        }
        catch
        {
            
        }
        return managedObjects
    }
    class func fetchAll(FromEntity entityName:String,Predicate predicate:NSPredicate?) -> [BAManagedObject]?
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : entityName)
        fetchRequest.predicate = predicate
        var managedObjects : [BAManagedObject]? = [BAManagedObject]()
        do
        {
            managedObjects = try self.getContext().fetch(fetchRequest) as? [BAManagedObject]
        }
        catch
        {
            
        }
        return managedObjects
    }
    class func deleteAll(FromEntity entityName:String,Predicate predicate:NSPredicate?) -> Bool {
        
        let managedObjects = fetchAll(FromEntity: entityName,Predicate: predicate)
        return self.deleteObjects(managedObjects)
    }
    class func deleteObjects(_ managedObjects : [BAManagedObject]?) -> Bool{
        
        guard let _managedObjects = managedObjects else{
            return false
        }
        var isDeleted = false
        for managedObject in _managedObjects
        {
            isDeleted = true
            self.getContext().delete(managedObject)
        }
        BAManagedObject.saveContext()
        return isDeleted
    }
    
}
