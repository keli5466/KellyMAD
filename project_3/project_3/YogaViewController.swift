//
//  YogaViewController.swift
//  project_3
//
//  Created by Kelly Linehan on 12/15/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//


import UIKit
import MobileCoreServices
import MediaPlayer
import AVFoundation
    
class YogaViewController: UIViewController, UITextFieldDelegate{
    var audioPlayer : AVAudioPlayer?
        
    @IBOutlet weak var yCalories: UILabel!
    @IBOutlet weak var yogaWeight: UITextField!
    @IBOutlet weak var yogaMinutes: UITextField!
    
    override func viewDidLoad() {
        yogaWeight.delegate=self
        yogaMinutes.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

        func updateYCalories(){
            let kilograms = (yogaWeight.text as NSString).floatValue/2.2
            let time = (yogaMinutes.text as NSString).floatValue/60
            let yMet = 3.floatValue
            let yproduct = kilograms*yMet
            let ytotal = (time*yproduct)
            var total = NSNumberFormatter()
            yCalories.text=total.stringFromNumber(ytotal)
            
        }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateYCalories()
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneYoga"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController; scene1ViewController.user.Ycalories=yCalories.text
        }
    }
    
        
    @IBAction func DoneYoga(sender: UIBarButtonItem) {
            let actionSheet=UIAlertController(title: "Media Action", message: "What would you like to do with your media?", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let cancel=UIAlertAction(title: "Go Back", style:UIAlertActionStyle.Cancel, handler: nil)
            actionSheet.addAction(cancel)
            let audio=UIAlertAction(title: "Good Music For Yoga", style:UIAlertActionStyle.Default, handler:  { action in
                let audioFilePath = NSBundle.mainBundle().pathForResource("Be Happy", ofType: "mp3")
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
