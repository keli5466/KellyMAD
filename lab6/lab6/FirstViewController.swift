//
//  FirstViewController.swift
//  lab6
//
//  Created by Kelly Linehan on 10/9/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var musicPicker: UIPickerView!
    @IBOutlet weak var choiceLabel: UILabel!
    
    let genre = ["Country", "Pop", "Rock", "Classical", "Alternative", "Hip Hop", "Jazz"]
    let decade = ["1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s"]
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0 {
            return genre.count
        }
        else {
            return decade.count
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component==0 {
            return genre[row]
        }
        else {
            return decade[row] }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genrerow = musicPicker.selectedRowInComponent(0)
        let decaderow = musicPicker.selectedRowInComponent(1)
        choiceLabel.text="You like \(genre[genrerow]) from the \(decade[decaderow])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning() }

}

