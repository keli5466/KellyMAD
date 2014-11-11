//
//  RunViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/10/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class RunViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var runMinutes: UITextField!
    @IBOutlet weak var runWeight: UITextField!
    @IBOutlet weak var rCalories: UILabel!

        
        override func viewDidLoad() {
            runMinutes.delegate=self
            runWeight.delegate=self
            super.viewDidLoad()
        }
        
        func updateRCalories(){
            let kilograms = (runWeight.text as NSString).floatValue/2.2
            let time = (runMinutes.text as NSString).floatValue/60
            let rMet = 10.floatValue
            let Rproduct = kilograms*rMet
            let Rtotal = (time*Rproduct)
            var total = NSNumberFormatter()
            rCalories.text=total.stringFromNumber(Rtotal)
            
        }
        
        
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            updateRCalories()
            return true
            
        }
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "doneRun"{
                var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Rcalories=rCalories.text
            }
        }

        // Do any additional setup after loading the view.

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
