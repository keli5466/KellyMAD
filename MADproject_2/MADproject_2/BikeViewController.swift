//
//  BikeViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/10/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class BikeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bikeMinutes: UITextField!
    @IBOutlet weak var bikeWeight: UITextField!
    @IBOutlet weak var bikeCalories: UILabel!

    override func viewDidLoad() {
        bikeMinutes.delegate=self
        bikeWeight.delegate=self
        super.viewDidLoad()
    }
    
    func updateBCalories(){
        let kilograms = (bikeWeight.text as NSString).floatValue/2.2
        let time = (bikeMinutes.text as NSString).floatValue/60
        let bMet = 10.floatValue
        let bproduct = kilograms*bMet
        let btotal = (time*bproduct)
        var total = NSNumberFormatter()
        bikeCalories.text=total.stringFromNumber(btotal)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateBCalories()
        return true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneBike"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Bcalories=bikeCalories.text
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
