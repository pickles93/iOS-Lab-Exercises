//
//  ViewController.swift
//  TakeAwayRestuarants
//
//  Created by Michael Jelleff on 29/04/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    var restaurantName:String?
    var restaurantPhone:String?
    var existingItem: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: AnyObject) {
        Model.sharedInstance.saveRestaurant(name.text, phone: phone.text, existing: existingItem)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func cancel(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}

