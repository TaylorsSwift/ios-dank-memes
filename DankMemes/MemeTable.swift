//
//  MemeTable.swift
//  DankMemes
//
//  Created by Taylor Caldwell on 6/11/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation
import UIKit

class MemeTable : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.memes = appDelegate.memes
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell", forIndexPath: indexPath) as! MemeTableCell
        let meme = self.memes[indexPath.row]
        cell.setText(meme.topText, bottomText: meme.bottomText)
        cell.imageView?.image = meme.memeImage
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Grab the DetailVC from Storyboard
        let object: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("MemeCellDetail")!
        let detailVC = object as! MemeCellDetail
        
        //Populate view controller with data from the selected item
        detailVC.meme = self.memes[indexPath.row]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailVC, animated: true)
        
    }
    
}