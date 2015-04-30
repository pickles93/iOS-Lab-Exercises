//
//  Model.swift
//  TakeAwayRestuarants
//
//  Created by Michael Jelleff on 29/04/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class Model {
    private var restaurants: [Restaurant] = [Restaurant]()
    
    func getRestaurant(indexPath: NSIndexPath) -> Restaurant {
        return restaurants[indexPath.row]
    }
    
    func getRestaurants() -> [Restaurant]{
        return restaurants
    }
    
    func loadRestaurants() {
        // Get a reference to your App Delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get a reference to a ManagedObjectContext for interacting with // the underlying database
        let managedContext = appDelegate.managedObjectContext!
        
        // Retrieve all the records in the table
        let fetchRequest = NSFetchRequest(entityName:"Restaurant")
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as! [Restaurant]?
        
        // Assign the results to the Model
        if let results = fetchedResults {
            restaurants = results
        }else{
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
    
    
    func saveRestaurant(name: String, phone:String, existing: Restaurant?) {
            //Reference to appDelegate
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            //get reference to managedContext to interact with underlying database
            let managedContext = appDelegate.managedObjectContext!
            
            let entity = NSEntityDescription.entityForName("Restaurant", inManagedObjectContext: managedContext)
            
            // Create an object based on the Entity
            let restaurant = Restaurant(entity: entity!, insertIntoManagedObjectContext: managedContext)
            
            
            // Set any properties
            restaurant.setValue(name, forKey: "name")
            restaurant.setValue(phone, forKey: "phone")
            
            // Check for errors and handle
            var error: NSError?
            if !managedContext.save(&error){
        println("Could not save \(error), \(error?.userInfo)")
            }
            
            self.restaurants.append(restaurant)
    }
    
    private struct Static{
                static var instance: Model?
    }
    
    private init(){}
    
    class var sharedInstance: Model{
                if (Static.instance == nil){
                Static.instance = Model()
                }
                return Static.instance!
    }
}

