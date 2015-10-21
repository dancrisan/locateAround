//
//  ViewController.swift
//  around_alpha
//
//  Created by Dan Crisan on 2015-10-18.
//  Copyright (c) 2015 Dan Crisan. All rights reserved.
//

import UIKit

class ListOfPeople: UIViewController {
    
    var personSelected = false;
    
    @IBOutlet var bluePerson: UIButton!
    
    @IBOutlet var mainButton: UIButton!
    
    @IBOutlet var checkButton: UIButton!
    
    @IBAction func adminActionButton(sender: AnyObject) {
        performSegueWithIdentifier("showBeacons", sender: self)
    }
    
    @IBAction func locatePeople(sender: AnyObject) {
        if(personSelected){
            performSegueWithIdentifier("locate", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkButton.imageView?.hidden = true;
        
           // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//        var svc =
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToHome(sender: AnyObject) {
        performSegueWithIdentifier("backToMain", sender: self)
    }
    
    
    @IBAction func slectFirstPerson(sender: AnyObject) {
        let image = UIImage(named: "check.png") as UIImage?
        checkButton.setImage(image, forState: .Normal);
        self.view.addSubview(checkButton);
        
        //        let image = UIImage(named: "check.png") as UIImage?
//        checkButton.setImage(image, forState: .Normal);
        if(!personSelected){
             mainButton.setTitle("LOCATE PEOPLE", forState: .Normal)
            checkButton.imageView?.hidden = false;
            personSelected = true;
        }
        else{
            mainButton.setTitle("SELECT PEOPLE", forState: .Normal);
            checkButton.imageView?.hidden = true;
            personSelected = false;
            
        }

        
        
       
    }
    
    
    
    //    @IBAction func adminButton(sender: AnyObject) {
    //        performSegueWithIdentifier("showListOfBeacons", sender: self)
    //    }
    
}

