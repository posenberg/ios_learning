//
//  ViewController.swift
//  tipster_swift
//
//  Created by Mel on 10/27/14.
//  Copyright (c) 2014 Melinda Po. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// put all your outlets in here
// create the names for all of the classes you want to work with
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
//end of all outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //viewDIdLoad is a method. We will configure these labels so that they will work.
        
        //initialize tip label
        //note: this will make the tip calculator start with 0.00
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        //variable for tipPercentages and throw them into an array
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // store whatever billamount in this variable
        
        //billField.text is a string but we want to change to decimal or float
        
        var billAmount = NSString(string: billField.text).doubleValue

        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        
        //let's use formatting to specify how many decimal places it needs to move
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
    }

    @IBAction func onTap(sender: AnyObject) {
        //with the Gesture, the tapping should dismiss the keyboard
        
        view.endEditing(true)
    }
}

