//
//  MemeCollection.swift
//  DankMemes
//
//  Created by Taylor Caldwell on 6/11/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import Foundation
import UIKit

class MemeCollection : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.memes = appDelegate.memes
        self.collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionCell
        let meme = self.memes[indexPath.row]
        cell.imageView.image = meme.memeImage
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //Grab the DetailVC from Storyboard
        let object: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier("MemeCellDetail")!
        let detailVC = object as! MemeCellDetail
        
        //Populate view controller with data from the selected item
        detailVC.meme = self.memes[indexPath.item]
        
        //Present the view controller using navigation
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
}