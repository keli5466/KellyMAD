//
//  ViewController.swift
//  LAB3
//
//  Created by Kelly Linehan on 9/16/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var capitlizedSwitch: UISwitch!
    @IBOutlet weak var fontSizeNumberLabel: UILabel!
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value;
        fontSizeNumberLabel.text=String(format: "%.0f",fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
        
    }
    @IBAction func updateFont(sender: UISwitch) {
        if capitlizedSwitch.on{
            titleLabel.text=titleLabel.text?.uppercaseString }
            
        else {
            titleLabel.text=titleLabel.text?.lowercaseString
        }
    }
    
    @IBAction func changeImage(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex==0{
            titleLabel.text="You're Hella Right"
            stateImage.image=UIImage(named: "north.jpeg")}
        else if imageControl.selectedSegmentIndex==1{
            titleLabel.text="ew , as if.."
            stateImage.image=UIImage(named:"south.jpeg")
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

