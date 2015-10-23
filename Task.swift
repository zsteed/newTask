//
//  Task.swift
//  Task
//
//  Created by JB on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {                    //Equatable is part of NSObjects

    private let NameKey = "name"
    private let NotesKey = "notes"
    private let DueDateKey = "dueDate"
    private let IsCompleteKey = "isComplete"

    var name: String
    var notes: String?
    var dueDate: NSDate?
    var isComplete: Bool

    init(name: String, notes: String? = "", dueDate: NSDate? = NSDate()) {   //Don't'Initial Bool should be set to a value
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = false

        super.init()    //What does this do?????
    }

//Does order of Decoder and Encoder matter????


    @objc required init?(coder aDecoder: NSCoder) {

        guard let name = aDecoder.decodeObjectForKey(NameKey) as? String

            else {

                self.name = ""
                self.notes = ""
                self.isComplete = false
                super.init()
                return nil

        }

        self.name = name
        self.notes = aDecoder.decodeObjectForKey(NotesKey) as? String
        self.dueDate = aDecoder.decodeObjectForKey(DueDateKey) as? NSDate
        self.isComplete = aDecoder.decodeBoolForKey(IsCompleteKey)

        super.init()

    }

    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        aCoder.encodeObject(notes, forKey: NotesKey)
        aCoder.encodeObject(dueDate, forKey: DueDateKey)
        aCoder.encodeBool(isComplete, forKey: IsCompleteKey)
    }



    override func isEqual(object: AnyObject?) -> Bool {             //Self is the class Task and param is the returned data???
        if let param = object as? Task {

           return (self.name == param.name) && (self.notes == param.notes) && (self.isComplete == param.isComplete)
        } else {
            return false
        }
    }

}

    func ==(lhs:Task,rhs:Task) -> Bool {

    return(lhs.name==rhs.name) && (lhs.notes==rhs.notes) && (lhs.isComplete==rhs.isComplete)
}