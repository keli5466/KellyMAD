//
//  ViewController.swift
//  sportsImage
//
//  Created by Kelly Linehan on 9/22/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var nameFeild: UITextField!
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        nameFeild.resignFirstResponder()
    }
    @IBOutlet weak var messageLabel: UILabel!
    @IBAction func chooseTeam(sender: UIButton) {
        if sender.tag==1 {
            sportImage.image=UIImage(named: "broncos.png")
        messageLabel.text="get ready for broncos season " + "\(nameFeild.text)"
    }
    if sender.tag==2 {
    sportImage.image=UIImage(named: "rockies.png")
    
    messageLabel.text="I am a rockies fan too " + "\(nameFeild.text)"
    
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

