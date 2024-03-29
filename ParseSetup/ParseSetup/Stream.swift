//
//  Stream.swift
//  ParseSetup
//
//  Created by Monte's Pro 13" on 3/12/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Parse

class Stream: NSObject {

    var name: String?
    var date: String?
    
    override init() {
    }
    
    init(name: String) {
        super.init()
        self.name = name
        date = getDate()
        print("Name and date of stream initialized.")
        Stream.saveStream(name, date: date) { (success: Bool, error: NSError?) -> Void in
            if error != nil {
                print("Oops.. unable to save stream to Parse! ERROR: \(error?.localizedDescription)")
            } else {
                print("Stream created and saved to parse successfully")
            }
        }
    }
    

    //Method to save stream to Parse
    class func saveStream(name: String?, date: String?, withCompletion completion: PFBooleanResultBlock?) {
        
        let stream = PFObject(className: "Stream")
        stream["name"] = name
        stream["date"] = date
        
        stream.saveInBackgroundWithBlock(completion)
    }
    
    //Method to get all streams from Parse
    class func getStreams(completionHandler: (streams: [Stream]?, success: Bool?, error: NSError?)-> ()) {
        
        var streams: [Stream]? = []

        //construct query
        let query = PFQuery(className: "Stream")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                for object in objects! {
                    let stream = Stream()
                    stream.name = object["name"] as? String
                    stream.date = object["date"] as? String
                    streams?.insert(stream, atIndex: 0)
                }
                completionHandler(streams: streams, success: true, error: nil)
            } else  {
                print("Unable to get streams from Parse")
                completionHandler(streams: nil, success: false, error: error)
            }
        }
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
