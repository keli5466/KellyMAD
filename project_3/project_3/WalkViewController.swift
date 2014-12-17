//
//  WalkViewController.swift
//  project_3
//
//  Created by Kelly Linehan on 12/15/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer
import AVFoundation
class WalkSceneViewController: UIViewController,UITextFieldDelegate {
    var audioPlayer : AVAudioPlayer?
    
    
    @IBOutlet weak var walkMinutes: UITextField!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var walkWeight: UITextField!
    
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
    @IBAction func WalkButton(sender: UIBarButtonItem) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancel=UIAlertAction(title: "Go Back", style:UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(cancel)
        let audio=UIAlertAction(title: "Good Music For Walking", style:UIAlertActionStyle.Default, handler:  { action in
            let audioFilePath = NSBundle.mainBundle().pathForResource("500 miles", ofType: "mp3")
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
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
