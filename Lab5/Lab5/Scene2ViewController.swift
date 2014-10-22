//
//  Scene2ViewController.swift
//  Lab5
//
//  Created by Kelly Linehan on 10/7/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController ,UITextFieldDelegate {


    @IBOutlet weak var userAuthor: UITextField!
    @IBOutlet weak var userBook: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier=="doneFavs"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController
            scene1ViewController.user.favBook=userBook.text
            scene1ViewController.user.favAuthor=userAuthor.text
        }
    }
    
    override func viewDidLoad() {
        userBook.delegate=self
        userAuthor.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
