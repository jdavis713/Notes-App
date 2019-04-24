//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Jordan Davis on 4/24/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let note = note, isViewLoaded else { return }
        
        noteTextView.text = note.text
    }

    
    var note: Note? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet var noteTextView: UITextView!
}
