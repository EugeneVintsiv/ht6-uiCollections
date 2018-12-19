//
//  ViewController.swift
//  HT6-UICollections
//
//  Created by Eugene on 05.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let sections = ["Incompleted", "completed"]

    var elements: [[CellData]] = [[
        CellData.init(title: "Note1", description: "Description 4 note 1", creationDate: "2018-01-01"),
        CellData.init(title: "Note2", description: "Description 4 note 2", creationDate: "2018-01-04")
    ], []]

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        updateTableContent()
        self.navigationItem.title = "Notes List"
    }

    private func registerCustomCells() {
        let cellNib = UINib(nibName: "NoteViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: NoteViewCell.reuseIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteViewCell.reuseIdentifier, for: indexPath) as! NoteViewCell
        let elemsInSection = elements[indexPath.section]
        cell.noteTitle.text = elemsInSection[indexPath.row].title
        cell.noteDate.text = elemsInSection[indexPath.row].creationDate
        cell.noteDescription.text = elemsInSection[indexPath.row].description
        
        cell.titleChangedCallback = { (data: String?) in
            self.elements[indexPath.section][indexPath.row].title = data ?? ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            elements[indexPath.section].remove(at: indexPath.row)
            updateTableContent()
        }
    }
}

// MARK: - edit note
extension NotesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let editController = currentStoryboard.instantiateViewController(withIdentifier: EditNoteViewController.viewIdentifier) as! EditNoteViewController
        assignCellDataTo(indexPath: indexPath, editController: editController)
        assignEndEditAction(editController: editController, indexPath: indexPath)
        navigationController?.pushViewController(editController, animated: true)
    }

    private func assignCellDataTo(indexPath: IndexPath, editController: EditNoteViewController) {
        let objToMove = indexPath.section == 0 ? elements[0][indexPath.row] : elements[1][indexPath.row]
        editController.nodeData = objToMove
    }

    private func assignEndEditAction(editController: EditNoteViewController, indexPath: IndexPath) {
        editController.onEndEditAction = { note in
            var noteTmp = note //cuz need 'var' for swap
            if indexPath.section == 0 {
                swap(&self.elements[0][indexPath.row], &noteTmp)
            } else {
                swap(&self.elements[1][indexPath.row], &noteTmp)
            }
            self.updateTableContent()
        }
    }
}

// MARK: - HandleTableContent
extension NotesViewController {
    private func updateTableContent() {
        tableView.reloadData()
    }

    private func generateRandomString(_ length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }

    private func getFormatterCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: Date())
    }

}

// MARK: - interaction with manage screens
extension NotesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createNote" {
            let targetScreen = segue.destination as! CreateNoteViewController
            targetScreen.onSaveAction = { (note) -> () in
                self.addNote(newNote: note)
            }
        }
    }

    func addNote(newNote note: CellData) {
        print("Received: \(note)")
        if note.isCompleted {
            elements[1].append(note)
        } else {
            elements[0].append(note)
        }
        updateTableContent()
    }
}

