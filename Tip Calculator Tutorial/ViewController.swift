//
//  ViewController.swift
//  Tip Calculator Tutorial
//
//  Created by Ricardo Vila on 12/27/15.
//  Copyright © 2015 Yo Jodiendo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var enterBillField: UIView!
    @IBOutlet weak var fadeinView: UIView!
    @IBOutlet var mainViewName: UIView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var splitchecksButton: UIView!
    @IBOutlet weak var split2check: UILabel!
    @IBOutlet weak var split3check: UILabel!
    @IBOutlet weak var split4check: UILabel!
    @IBOutlet weak var split5check: UILabel!
    @IBOutlet weak var split6check: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        totalLabel.text = "$0.00"
        tipLabel.text = "$0.00"
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        // Dissappears everything except the bill field
        self.clearButton.alpha = 0
        self.fadeinView.alpha = 0
        self.enterBillField.alpha = 1
        self.optionsView.alpha = 0
        
        // Positions bill field and its view in its initial position
        billField.frame = CGRect(x: 8, y: 10, width: 264, height: 50)
        enterBillField.frame = CGRect(x: 20, y: 218, width: 280, height: 50)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Main view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("default_tip_percentage")
        
        if  tipValue == 0.22 {
            tipControl.selectedSegmentIndex = 2
        } else if tipValue == 0.20 {
            tipControl.selectedSegmentIndex = 1
        } else if tipValue == 0.18 {
            tipControl.selectedSegmentIndex = 0
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("Main view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("Main view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("Main view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject){
        
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.fadeinView.alpha = 1
            self.optionsView.alpha = 1
            self.clearButton.alpha = 1
            
            self.enterBillField.frame =
                CGRect(x: 20, y: 101, width: 280, height: 50)
        })
        
        
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        let split2checkf = total / 2
        let split3checkf = total / 3
        let split4checkf = total / 4
        let split5checkf = total / 5
        let split6checkf = total / 6
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        split2check.text = String(format: "$%.2f", split2checkf)
        split3check.text = String(format: "$%.2f", split3checkf)
        split4check.text = String(format: "$%.2f", split4checkf)
        split5check.text = String(format: "$%.2f", split5checkf)
        split6check.text = String(format: "$%.2f", split6checkf)
        
        
        
        }
    
    

    
    // Function to be called when billField (TextField) is done being edited
    @IBAction func billfieldEditingEnded(sender: AnyObject) {
     
    }
    
    @IBAction func clearbuttonPressed(sender: AnyObject) {
        
        billField.text = ""
        self.optionsView.alpha = 0
        self.fadeinView.alpha = 0
        self.clearButton.alpha = 0
        
        UIView.animateWithDuration(0.4, animations: {
            self.enterBillField.frame = CGRect(x: 20, y: 218, width: 280, height: 50)
        })
        
    }
    
    @IBAction func splitchecksButtonPressed(sender: AnyObject) {
        billField.resignFirstResponder()
    }
    
    
    
    

}

