//
//  ViewController.swift
//  MADproject_2
//
//  Created by Kelly Linehan on 11/7/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 var user=walking()
    @IBOutlet weak var caloriesBurned: UILabel!

    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        if segue.identifier == "doneWalk" {
                caloriesBurned.text=user.Wcalories! + " Calories were burned"
        }
        if segue.identifier == "doneRun" {
                caloriesBurned.text=user.Rcalories! + " Calories were burned"
            }
        if segue.identifier == "doneSwim" {
            caloriesBurned.text=user.Scalories! + " Calories were burned"
        }
        if segue.identifier == "doneBike" {
            caloriesBurned.text=user.Bcalories! + " Calories were burned"
        }
        if segue.identifier == "doneYoga" {
            caloriesBurned.text=user.Ycalories! + " Calories were burned"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

}