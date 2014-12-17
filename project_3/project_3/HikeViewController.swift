//
//  HikeViewController.swift
//  project_3
//
//  Created by Kelly Linehan on 12/15/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer
import AVFoundation

class HikeViewController: UIViewController , UITextFieldDelegate{
    var audioPlayer : AVAudioPlayer?

    @IBOutlet weak var hikeMinutes: UITextField!
    @IBOutlet weak var hikeWeight: UITextField!
    @IBOutlet weak var hikeCalories: UILabel!
    
    override func viewDidLoad() {
        hikeMinutes.delegate=self
        hikeWeight.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func updateHCalories(){
        let kilograms = (hikeWeight.text as NSString).floatValue/2.2
        let time = (hikeMinutes.text as NSString).floatValue/60
        let hMet = 7.floatValue
        let hproduct = kilograms*hMet
        let htotal = (time*hproduct)
        var total = NSNumberFormatter()
        hikeCalories.text=total.stringFromNumber(htotal)
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateHCalories()
        return true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneHike"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Hcalories=hikeCalories.text
        }
    }

    @IBAction func HikeButton(sender: UIBarButtonItem) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancel=UIAlertAction(title: "Go Back", style:UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(cancel)
        let audio=UIAlertAction(title: "Good Music For A Hike", style:UIAlertActionStyle.Default, handler:  { action in
            let audioFilePath = NSBundle.mainBundle().pathForResource("Rocky", ofType: "mp3")
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
