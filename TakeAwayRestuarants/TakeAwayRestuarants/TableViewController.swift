//
//  TableViewController.swift
//  TakeAwayRestuarants
//
//  Created by Michael Jelleff on 29/04/2015.
//  Copyright (c) 2015 RMIT. All rights reserved.
//

import UIKit

class TableViewController : UITableViewController {
    private var model = Model.sharedInstance

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        model.getRestaurants()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        model.getRestaurants()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //sets the number rows needed in the tableView
    override func tableView(tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getRestaurants().count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //creates cells to display on the table
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableCell = self.tableView.dequeueReusableCellWithIdentifier("RestaurantCell", forIndexPath: indexPath) as! UITableViewCell
        tableCell.textLabel?.text = model.getRestaurant(indexPath).getName()
        tableCell.detailTextLabel?.text = model.getRestaurant(indexPath).getPhone()
        return tableCell
        
    }
    
    

    
    
}