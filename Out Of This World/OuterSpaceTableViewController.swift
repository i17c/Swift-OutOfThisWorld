//
//  OuterSpaceTableViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/5/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

class OuterSpaceTableViewController: UITableViewController {
    
    var planets = [SpaceObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        for planetData in AstronomicalData.allKnownPlanets() {
            var imageName = "\(planetData[PLANET_NAME]).jpg"
            var planet = SpaceObject(initWithData: planetData as NSDictionary, andImage: UIImage(named: imageName))
            self.planets += [planet]
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if sender.isKindOfClass(UITableViewCell) {
            if segue.destinationViewController.isKindOfClass(SpaceImageViewController) {
                var nextViewController = segue.destinationViewController as SpaceImageViewController
                var path = self.tableView.indexPathForCell(sender as UITableViewCell)
                nextViewController.spaceObject = self.planets[path.row]
            }
        }
        
        if sender.isKindOfClass(NSIndexPath) {
            if segue.destinationViewController.isKindOfClass(SpaceDataViewController) {
                var nextViewController = segue.destinationViewController as SpaceDataViewController
                var path = sender as NSIndexPath
                nextViewController.spaceObject = self.planets[path.row]
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.planets.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        //Configure the cell...
        var planet = self.planets[indexPath.row]
        cell.textLabel.text = planet.name!
        cell.detailTextLabel.text = planet.nickname!
        cell.imageView.image = planet.spaceImage!
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel.textColor = UIColor.whiteColor()
        cell.detailTextLabel.textColor = UIColor(white: 0.5, alpha: 1.0)

        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView!, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath!) {
        self.performSegueWithIdentifier("Push To Space Data", sender: indexPath)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
