//
//  SwimViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/10/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class SwimViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var swimWeight: UITextField!
    @IBOutlet weak var swimMinutes: UITextField!
    @IBOutlet weak var sCalories: UILabel!

    override func viewDidLoad() {
        swimMinutes.delegate=self
        swimWeight.delegate=self
        super.viewDidLoad()
    }
    
    func updateSCalories(){
        let kilograms = (swimWeight.text as NSString).floatValue/2.2
        let time = (swimMinutes.text as NSString).floatValue/60
        let sMet = 7.floatValue
        let Sproduct = kilograms*sMet
        let Stotal = (time*Sproduct)
        var total = NSNumberFormatter()
        sCalories.text=total.stringFromNumber(Stotal)
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateSCalories()
        return true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSwim"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Scalories=sCalories.text
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
