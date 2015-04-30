//
//  Restaurant.swift
//  TakeAwayRestuarants
//
//  Created by Michael Jelleff on 29/04/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import Foundation

class Restaurant {
    var name:String
    var phone:String

    
    init(name:String, phone:String){
        self.name = name
        self.phone = phone
    }
    
    func getName() -> String{
        return self.name
    }
    
    func getPhone() -> String{
        return self.phone
    }
    
}