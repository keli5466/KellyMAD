//
//  ViewController.swift
//  countries
//
//  Created by Kelly Linehan on 10/28/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ViewController:UITableViewController, UITableViewDataSource,UITableViewDelegate {
    
    var continentList=Continents()
    
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        continentList.continentData = NSMutableDictionary(contentsOfFile: path!)!
        continentList.continents = continentList.continentData.allKeys as [String]
        super.viewDidLoad()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return continentList.continentData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text=continentList.continents[indexPath.row]
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier=="countrysegue"{
            var countryVC=segue.destinationViewController as DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow()!
            countryVC.title=continentList.continents[indexPath.row]
            countryVC.continentCountries=continentList
            countryVC.selectedContinent=indexPath.row
            }
            else if segue.identifier=="continentsegue"{
            var infoVC=segue.destinationViewController as
            ContinentInfoViewController
            let editingCell:UITableViewCell=sender as UITableViewCell
            let indexPath:NSIndexPath=tableView.indexPathForCell(editingCell)!; infoVC.name=continentList.continents[indexPath.row]
            let countries=continentList.continentData.objectForKey(infoVC.name) as
            [String]; infoVC.number=String(countries.count)
            }

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

