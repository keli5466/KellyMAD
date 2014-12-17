//
//  BikeViewController.swift
//  project_3
//
//  Created by Kelly Linehan on 12/15/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//
import UIKit
import MobileCoreServices
import MediaPlayer
import AVFoundation
class BikeViewController: UIViewController, UITextFieldDelegate {
    var audioPlayer : AVAudioPlayer?
    
    @IBOutlet weak var bikeCalories: UILabel!
    @IBOutlet weak var bikeMinutes: UITextField!
    @IBOutlet weak var bikeWeight: UITextField!
    override func viewDidLoad() {
        bikeWeight.delegate=self
        bikeMinutes.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateBCalories(){
        let kilograms = (bikeWeight.text as NSString).floatValue/2.2
        let time = (bikeMinutes.text as NSString).floatValue/60
        let bMet = 10.floatValue
        let bproduct = kilograms*bMet
        let btotal = (time*bproduct)
        var total = NSNumberFormatter()
        bikeCalories.text=total.stringFromNumber(btotal)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateBCalories()
        return true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneBike"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Bcalories=bikeCalories.text
        }
    }
    
    @IBAction func bikeButton(sender: UIBarButtonItem) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancel=UIAlertAction(title: "Go Back", style:UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(cancel)
        let audio=UIAlertAction(title: "Good Music For Biking", style:UIAlertActionStyle.Default, handler:  { action in
            let audioFilePath = NSBundle.mainBundle().pathForResource("Bicycle", ofType: "mp3")
            let fileURL = NSURL(fileURLWithPath: audioFilePath!)
            self.audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
            if self.audioPlayer != nil {
                self.audioPlayer!.play()
            }
        })
        actionSheet.addAction(audio)
        presentViewController(actionSheet, animated: true, completion: nil)
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
