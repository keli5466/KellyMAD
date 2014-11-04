//
//  ThirdViewController.swift
//  lab6
//
//  Created by Kelly Linehan on 10/9/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func submitQuestion(sender: AnyObject) {
        var email : String
        email = "mailto:aileen.pierce@colorado.edu?subject=Question from music app&body=\(questionTextView.text) from \(nameTextField.text) \(emailTextField.text)"
        email = email.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        UIApplication.sharedApplication().openURL(NSURL.URLWithString(email))
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to: nil, from: nil, forEvent: nil)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
            nameTextField.delegate=self
            emailTextField.delegate=self
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
