//
//  CountryViewController.swift
//  countries
//
//  Created by Kelly Linehan on 11/6/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var countryTextField: UITextField!
    var addedCountry = String()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier=="doneSegue"{
            if !countryTextField.text.isEmpty{
                addedCountry=countryTextField.text
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
