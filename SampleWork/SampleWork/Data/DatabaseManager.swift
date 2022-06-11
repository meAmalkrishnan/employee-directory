//
//  DatabaseManager.swift
//  SampleWork

import Foundation
import UIKit
import CoreData

class DatabaseManager{
    func getInsertContextEntity(entity: String)-> (NSEntityDescription?, NSManagedObjectContext?)  {
        
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return (nil, nil) }
          
          let managedContext = appDelegate.persistentContainer.viewContext
          
          return (NSEntityDescription.entity(forEntityName: entity, in: managedContext)!, managedContext)
    }
    
    func getUpdateContextEntity(entity: String)-> (NSFetchRequest<NSFetchRequestResult>?, NSManagedObjectContext?)  {
        
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return (nil, nil) }
          
          let managedContext = appDelegate.persistentContainer.viewContext
          
          return (NSFetchRequest<NSFetchRequestResult>(entityName: entity), managedContext)
    }
    
    func getRetrieveContextEntity(entity: String)-> (NSFetchRequest<NSFetchRequestResult>?, NSManagedObjectContext?)  {
        
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return (nil, nil) }
          
          let managedContext = appDelegate.persistentContainer.viewContext
          
          return (NSFetchRequest<NSFetchRequestResult>(entityName: entity), managedContext)
    }
    
    func getDeleteAllEntity(entity: String)-> (NSFetchRequest<NSFetchRequestResult>?, NSManagedObjectContext?)  {
          
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return (nil, nil) }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        return (NSFetchRequest<NSFetchRequestResult>(entityName: entity), managedContext)
    }
}
