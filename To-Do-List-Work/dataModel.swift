//
//  dataModel.swift
//  To-Do-List-Work
//
//  Created by 김종현 on 2017. 6. 14..
//  Copyright © 2017년 DIT Apps. All rights reserved.
//

import Foundation

class dataModel : NSObject, NSCoding {
    //var id: String
    //var image: String
    var title: String
    var date: String
    var image : String
    var content : String
    
    init (title: String, date: String, image: String, content: String) {
        //self.id = id
        //self.image = image
        self.title = title
        self.date = date
        self.image = image
        self.content = content
    }
    
    // object decode
    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let date = aDecoder.decodeObject(forKey: "date") as! String
        let image = aDecoder.decodeObject(forKey:"image")as! String
        let content = aDecoder.decodeObject(forKey:"content")as! String
        print("title = \(String(describing: title))")
        
        self.init(title: title, date: date, image: image, content: content)
        
    }
    
    // object encode
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.date, forKey: "date")
        aCoder.encode(self.image, forKey:"image")
        aCoder.encode(self.content, forKey:"content")
    }
    
}
