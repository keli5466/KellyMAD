//
//  DataManager.swift
//  task_lab13
//
//  Created by Kelly Linehan on 12/3/14.
//  Copyright (c) 2014 Kelly Linehan. All rights reserved.
//

import Foundation

class DataManager {
    var path = []
    
    func docFilePath(filename: String)->String? {
     
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let dir = paths[0] as String
        return dir.stringByAppendingPathComponent(filename)
    }
}