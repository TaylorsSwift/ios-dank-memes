//
//  MemeCollectionCellDetail.swift
//  DankMemes
//
//  Created by Taylor Caldwell on 6/11/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import UIKit

class MemeCellDetail: UIViewController {

    @IBOutlet weak var memeImage: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.memeImage.image = self.meme.memeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
