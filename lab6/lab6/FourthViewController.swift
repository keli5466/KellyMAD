//
//  FourthViewController.swift
//  lab6
//
//  Created by Kelly Linehan on 11/3/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var artistPicker: UIPickerView!
    

    let artistComponent = 0
    let albumComponent = 1
    
    var artistAlbums = NSDictionary()
    var artists = [String]()
    var albums = [String]()
    
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("artistalbums", ofType: "plist")
        artistAlbums = NSDictionary(contentsOfFile:path!)!
        artists = artistAlbums.allKeys as [String]
        let selectedArtist = artists[0]
        albums = artistAlbums.objectForKey(selectedArtist) as [String]
        super.viewDidLoad()
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==artistComponent {
            return artists.count
        }
        else {
            return albums.count
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if component==artistComponent {
            return artists[row]
        }
        else {
            return albums[row]
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component==artistComponent {
            let selectedArtist = artists[row]
            albums = artistAlbums.objectForKey(selectedArtist) as [String]
            artistPicker.selectRow(0, inComponent: albumComponent, animated: true)
            artistPicker.reloadComponent(albumComponent)
        }
        let artistrow = artistPicker.selectedRowInComponent(0)
        let albumrow = artistPicker.selectedRowInComponent(1)
        choiceLabel.text="You like \(albums[albumrow]) by \(artists[artistrow])"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    


}
