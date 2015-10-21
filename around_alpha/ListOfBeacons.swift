//
//  ListOfBeacons.swift
//  around_alpha
//
//  Created by Dan Crisan on 2015-10-18.
//  Copyright (c) 2015 Dan Crisan. All rights reserved.
//

import UIKit

class ListOfBeacons: UIViewController {
    
    var keyboardPresent: Bool = false;
    var beaconSelected: Bool = false;
    var beaconPaired: Bool = false;


    @IBOutlet var textBlueBeacon: UITextField!
    @IBOutlet weak var butBlueBeacon: UIButton!
    @IBOutlet weak var checkBlueBeacon: UIButton!

    
    @IBOutlet var textWhiteBeacon: UITextField!
    @IBOutlet var butWhiteBeacon: UIButton!
    
    @IBOutlet var textPinkBeacon: UITextField!
    @IBOutlet var butPinkBeacon: UIButton!
    
    @IBOutlet var textRedBeacon: UITextField!
    @IBOutlet var butRedBeacon: UIButton!
    
    @IBOutlet var textOrangeBeacon: UITextField!
    @IBOutlet var butOrangeBeacon: UIButton!
    
    @IBOutlet var textGreenBeacon: UITextField!
    @IBOutlet var butGreenBeacon: UIButton!


    @IBOutlet weak var mainButton: UIButton!
    
    
    @IBAction func backToHome(sender: AnyObject) {
        performSegueWithIdentifier("backToHomeModal", sender: self)

    }
    
    @IBAction func hey(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textBlueBeacon.hidden = true;
        checkBlueBeacon.imageView?.hidden = true;
//        checkBlueBeacon.hidden = true;
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        //Looks for single or multiple taps.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBarHidden = true


        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        keyboardPresent = false;
    }
    
    func keyboardWillShow(sender: NSNotification) {
        
        if(!keyboardPresent){
            self.view.frame.origin.y -= 175
            keyboardPresent = true;
        }
        
    }
    
    func keyboardWillHide(sender: NSNotification) {
        
        if(keyboardPresent){
            self.view.frame.origin.y += 175
        }
    }


    @IBAction func gestBlueBeacon(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began{
            //print("heeeellooo there2!");
            butBlueBeacon.hidden = true;
            textBlueBeacon.hidden = false;
//            
            mainButton.setTitle("RENAME BEACON", forState: .Normal)
            textBlueBeacon.becomeFirstResponder();
            beaconSelected = true;
        }

    }
    
    @IBAction func mainButtonController(sender: AnyObject) {
//                print(beaconSelected);
        if(mainButton.currentTitle == "RENAME BEACON"){
            butBlueBeacon.setTitle(textBlueBeacon.text, forState: .Normal)
//            butBlueBeacon.setTitleColor(butBlueBeacon.titleLabel?.textColor, forState: .Normal)

            textBlueBeacon.hidden = true;
            butBlueBeacon.hidden = false;
                    //            blueButton.add
            mainButton.setTitle("SELECT BEACON", forState: .Normal)
        }
        
        if(mainButton.currentTitle == "PAIR BEACON"){
            butBlueBeacon.setTitleColor(UIColor.greenColor(), forState: .Normal)
            beaconPaired = true;
            mainButton.setTitle("SELECT BEACON", forState: .Normal);
        }
        if(mainButton.currentTitle == "UNPAIR BEACON"){
            butBlueBeacon.setTitleColor(UIColor.whiteColor(), forState: .Normal)
         checkBlueBeacon.imageView?.hidden = true;
            beaconPaired = false;
            mainButton.setTitle("SELECT BEACON", forState: .Normal);
        }

    }
    
    @IBAction func pressBlueBeaconWord(sender: AnyObject) {
        selectBlueBeacon();
    }
    
    
    
    func selectBlueBeacon(){
        let image = UIImage(named: "check.png") as UIImage?
        //checkBlueBeacon.frame = CGRectMake(200, 74, 29, 30);
        checkBlueBeacon.setImage(image, forState: .Normal);
        self.view.addSubview(checkBlueBeacon);

        if(!beaconPaired){
            mainButton.setTitle("PAIR BEACON", forState: .Normal);
            checkBlueBeacon.imageView?.hidden = false;
        }
        else{
            mainButton.setTitle("UNPAIR BEACON", forState: .Normal);
            
        }
    }
    
    static let sharedInsatnce = ListOfBeacons();
    
//    static func getBlueBeaconName() -> String{
//        return butBlueBeacon.currentTitle!;
//    }
    
 





    
}