//
//  Model.swift
//  TakeAwayRestuarants
//
//  Created by Michael Jelleff on 29/04/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation
class Model {
    private var restaurants = [Restaurant]()
    
    func getRestaurant(indexPath: NSIndexPath) -> Restaurant {
        return restaurants[indexPath.row]
    }
    
    func getRestaurants() -> [Restaurant]{
        return restaurants
    }
    
    func saveRestaurant(name: String, phone:String, existing: Restaurant?) {
        var restaurant = Restaurant(name:name, phone:phone)
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

