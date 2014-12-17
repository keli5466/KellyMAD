//
//  RunViewController.swift
//  project_3
//
//  Created by Kelly Linehan on 12/15/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer
import AVFoundation

class RunViewController: UIViewController , UITextFieldDelegate {
    var audioPlayer : AVAudioPlayer?
    
@IBOutlet weak var runMinutes: UITextField!
@IBOutlet weak var runWeight: UITextField!
@IBOutlet weak var rCalories: UILabel!
    
    override func viewDidLoad() {
        runMinutes.delegate=self
        runWeight.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func updateRCalories(){
        let kilograms = (runWeight.text as NSString).floatValue/2.2
        let time = (runMinutes.text as NSString).floatValue/60
        let rMet = 10.floatValue
        let Rproduct = kilograms*rMet
        let Rtotal = (time*Rproduct)
        var total = NSNumberFormatter()
        rCalories.text=total.stringFromNumber(Rtotal)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateRCalories()
        return true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneRun"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Rcalories=rCalories.text
        }
    }
    @IBAction func runButton(sender: UIBarButtonItem) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancel=UIAlertAction(title: "Go Back", style:UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(cancel)
        let audio=UIAlertAction(title: "Good Music For A Run", style:UIAlertActionStyle.Default, handler:  { action in
            let audioFilePath = NSBundle.mainBundle().pathForResource("I Ran", ofType: "mp3")
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
    }
}
        // Dispose of any resources that can be recreated.