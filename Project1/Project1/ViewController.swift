//
//  ViewController.swift
//  Project1

//  My project is calculating the calories burn from the user. It asks them if they walk or ran , and it asked for their weight and the minutes they preformed the activty to return the calories they burned. I plan on testing it with an ipad.

//  Created by Kelly Linehan on 10/1/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
                            
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var actionControl: UISegmentedControl!
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateRCalories(){
        let kilograms = (weight.text as NSString).floatValue/2.2
        let time = (minutes.text as NSString).floatValue/60
        let rMet = 10.floatValue
        let Rproduct = kilograms*rMet
        let Rtotal = (time*Rproduct)
        var total = NSNumberFormatter()
        calories.text=total.stringFromNumber(Rtotal)

    }
    func updateWCalories(){
        let kilograms = (weight.text as NSString).floatValue/2.2
        let time = (minutes.text as NSString).floatValue/60
        let wMet = 2.floatValue
        let Wproduct = kilograms*wMet
        let Wtotal = (time*Wproduct)
        var total = NSNumberFormatter()
        calories.text=total.stringFromNumber(Wtotal)
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        minutes.resignFirstResponder()
        weight.resignFirstResponder()
    }
    
    
    @IBAction func controlAction(sender: UISegmentedControl) {
        if actionControl.selectedSegmentIndex==0{
            questionImage.image=UIImage(named: "walk.jpeg")
        }
        else if actionControl.selectedSegmentIndex==1{
            questionImage.image=UIImage(named: "run.jpeg")
        }
    }

    func textFieldDidEndEditing(textField: UITextField!) {
        if actionControl.selectedSegmentIndex==0{
            updateWCalories()
        }
        else {
            updateRCalories()
        }
    }
    
    override func viewDidLoad() {
        minutes.delegate=self
        weight.delegate=self
        super.viewDidLoad()
        actionControl.selectedSegmentIndex = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

