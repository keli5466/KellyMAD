//
//  YogaViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/10/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class YogaViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var yogaWeight: UITextField!
    @IBOutlet weak var yogaMinutes: UITextField!
    @IBOutlet weak var yCalories: UILabel!
    
    
    override func viewDidLoad() {
        yogaWeight.delegate=self
        yogaMinutes.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

func updateYCalories(){
    let kilograms = (yogaWeight.text as NSString).floatValue/2.2
    let time = (yogaMinutes.text as NSString).floatValue/60
    let yMet = 3.floatValue
    let yproduct = kilograms*yMet
    let ytotal = (time*yproduct)
    var total = NSNumberFormatter()
    yCalories.text=total.stringFromNumber(ytotal)
    
}


func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    updateYCalories()
    return true
    
}
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "doneYoga"{
        var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Ycalories=yCalories.text
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
