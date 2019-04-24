//
//  NoteController.swift
//  Notes
//
//  Created by Jordan Davis on 4/24/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import Foundation

class NoteController {
    
    init() {
        //create test data
        createNote(withText: "Walk the dog")
        createNote(withText: "Eat Lunch at noon!")
        createNote(withText: "In a storyboard-based application, you will often want to do a little preparation before navigation")
    }
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        
        notes.append(note)
    }
    
    
    var notes: [Note] = [] // Array of notes
}
