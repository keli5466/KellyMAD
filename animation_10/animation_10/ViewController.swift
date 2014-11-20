//
//  ViewController.swift
//  animation_10
//
//  Created by Kelly Linehan on 11/11/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var delta = CGPointMake(12,4)
    //delta is how much you want to move the ball everytime it moves moving 12 points horizontall and 4 points vertically
    var ballRadius = CGFloat()
    var timer = NSTimer()
    var translation = CGPointMake(0.0, 0.0)
    var angle: CGFloat=0.0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    
    
    @IBAction func changeSliderValue() {
        sliderLabel.text=String(format: "%.2f",slider.value)
        timer=NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    
    //move the center of image view, accessing the center in ordr to move image view , add using the delta accesss 12 with . x and 4 with .y . the if statmenst one is for x and one is for y. is it greater then the bounds so it will reverse the negative and inscreaese by -12 instead of 12 minus ballraduis. so it hits the bounds instead of out of it widtha nd heigt
    func moveImage(){
        let duration=Double(slider.value)
        UIView.beginAnimations("tennis ball", context: nil)
        UIView.animateWithDuration(duration, animations: { self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
        self.imageView.center=CGPointMake(self.imageView.center.x + self.delta.x ,
            self.imageView.center.y + self.delta.y )
        })
        
        UIView.commitAnimations()
        angle += 0.02
        
        if angle > CGFloat(2*M_PI) {
            angle=0
        }
        
        if imageView.center.x > self.view.bounds.size.width-ballRadius ||
            imageView.center.x < ballRadius{ delta.x = -delta.x
            
        }
        if imageView.center.y > self.view.bounds.size.height - ballRadius || imageView.center.y < ballRadius {
            delta.y = -delta.y
        }
    }
 
    override func viewDidLoad() {
                ballRadius=imageView.frame.size.width/2
                changeSliderValue()
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

