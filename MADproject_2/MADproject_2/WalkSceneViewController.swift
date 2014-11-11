//
//  WalkSceneViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/7/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class WalkSceneViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var walkMinutes: UITextField!
    @IBOutlet weak var walkWeight: UITextField!
    @IBOutlet weak var calories: UILabel!
    
    override func viewDidLoad() {
        walkMinutes.delegate=self
        walkWeight.delegate=self
        super.viewDidLoad()
    }
    func updateWCalories(){
        let kilograms = (walkWeight.text as NSString).floatValue/2.2
        let time = (walkMinutes.text as NSString).floatValue/60
        let wMet = 2.floatValue
        let Wproduct = kilograms*wMet
        let Wtotal = (time*Wproduct)
        var total = NSNumberFormatter()
        calories.text=total.stringFromNumber(Wtotal)
        }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateWCalories()
        return true
    }

    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneWalk"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Wcalories=calories.text
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


