//
//  SwimViewController.swift
//  project_3
//
//  Created by Kelly Linehan on 12/15/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit
import MobileCoreServices
import MediaPlayer
import AVFoundation
class SwimViewController: UIViewController, UITextFieldDelegate{
    
    var audioPlayer : AVAudioPlayer?
    

    @IBOutlet weak var swimMinutes: UITextField!
    @IBOutlet weak var swimWeight: UITextField!
    @IBOutlet weak var sCalories: UILabel!

    
    override func viewDidLoad() {
        swimWeight.delegate=self
        swimMinutes.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateSCalories(){
        let kilograms = (swimWeight.text as NSString).floatValue/2.2
        let time = (swimMinutes.text as NSString).floatValue/60
        let sMet = 7.floatValue
        let Sproduct = kilograms*sMet
        let Stotal = (time*Sproduct)
        var total = NSNumberFormatter()
        sCalories.text=total.stringFromNumber(Stotal)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(textField: UITextField!) {
        updateSCalories()
    }
    @IBAction func swimButton(sender: AnyObject) {
        let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancel=UIAlertAction(title: "Go Back", style:UIAlertActionStyle.Cancel, handler: nil)
        actionSheet.addAction(cancel)
        let audio=UIAlertAction(title: "Good Music For Swimming", style:UIAlertActionStyle.Default, handler:  { action in
            let audioFilePath = NSBundle.mainBundle().pathForResource("Jump", ofType: "mp3")
            let afileURL = NSURL(fileURLWithPath: audioFilePath!)
            self.audioPlayer = AVAudioPlayer(contentsOfURL: afileURL, error: nil)
            if self.audioPlayer != nil {
                self.audioPlayer!.play()
            }
        })
        actionSheet.addAction(audio)
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSwim"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Scalories=sCalories.text
        }
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
