//
//  Image.swift
//  ParseSetup
//
//  Created by Monte's Pro 13" on 3/16/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class Image: NSObject {

    var image: UIImage?
    var date: String?
    var location: String?
    
    init(image: UIImage) {
        super.init()
        self.image = image
        self.date = getDate()
        self.location = "San Francisco"
        print("Image, date and location of image initialized.")
    }
    
    func getDate() -> String {
        let getDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [.Hour, .Day, .Month, .Year]
        let components = calendar.components(unitFlags, fromDate: getDate)
        let date = "\(components.day)/\(components.month)/\(components.year)"
        
        return date
    }
    
}
