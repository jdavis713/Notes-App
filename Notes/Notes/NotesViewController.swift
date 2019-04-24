//
//  NotesViewController.swift
//  Notes
//
//  Created by Jordan Davis on 4/24/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
    }
  
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        print("save")
        
        // 1. get the text if its present
        // 2. create a new note
        // 3. get the display
        guard let text = notesTextView.text,
            !text.isEmpty else { return }
        
        noteController.createNote(withText: text)
        
        tableView.reloadData()
        
        notesTextView.text = ""
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoteDetail" {
            guard let noteDetailVC = segue.destination as? NoteDetailViewController,
                let cell = sender as? NoteTableViewCell else { return }
            
            noteDetailVC.note = cell.note
        }
    }
    
    let noteController = NoteController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var notesTextView: UITextView!
    
}

extension NotesViewController: UITableViewDelegate {
    
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        
        //Get the note for row
        
        let note = noteController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
                
       noteCell.noteLabel.text = note.text
        //noteDetailVC.note = note
    
        return cell
    }
    
    
}

extension NotesViewController: NoteTableViewCellDelegate {
    func shareNote(for cell: NoteTableViewCell) {
        print("share note to the world! \(cell.note)")
        
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}
