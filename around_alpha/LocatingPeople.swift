//
//  ViewController.swift
//  around_alpha
//
//  Created by Dan Crisan on 2015-10-18.
//  Copyright (c) 2015 Dan Crisan. All rights reserved.
//

import UIKit

class LocatingPeople: UIViewController {
    
//    @IBAction func adminActionButton(sender: AnyObject) {
//        performSegueWithIdentifier("showBeacons", sender: self)
//    }
//    
//    @IBAction func listOfPeopleActionButton(sender: AnyObject) {
//        performSegueWithIdentifier("goToListOfPeople", sender: self)
//    }
    @IBAction func backToMainPage(sender: AnyObject) {
        performSegueWithIdentifier("backToMain", sender: self)
    }
    
    @IBAction func backToListOfPeople(sender: AnyObject) {
        performSegueWithIdentifier("backToList", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @IBAction func adminButton(sender: AnyObject) {
    //        performSegueWithIdentifier("showListOfBeacons", sender: self)
    //    }
    
}

