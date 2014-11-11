//
//  HikeViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/10/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class HikeViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var hikeMinutes: UITextField!
    @IBOutlet weak var hikeWeight: UITextField!
    @IBOutlet weak var hikeCalories: UILabel!

    override func viewDidLoad() {
        hikeMinutes.delegate=self
        hikeWeight.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func updateHCalories(){
        let kilograms = (hikeWeight.text as NSString).floatValue/2.2
        let time = (hikeMinutes.text as NSString).floatValue/60
        let hMet = 7.floatValue
        let hproduct = kilograms*hMet
        let htotal = (time*hproduct)
        var total = NSNumberFormatter()
        hikeCalories.text=total.stringFromNumber(htotal)
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateHCalories()
        return true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneHike"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Hcalories=hikeCalories.text
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
