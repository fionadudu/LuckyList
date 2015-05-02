//
//  Common.swift
//  Lucky💗List
//
//  Created by babykang on 15/4/26.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import Foundation

func dateFromString (dateStr: String) -> NSDate? {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.dateFromString(dateStr)
    return date
}