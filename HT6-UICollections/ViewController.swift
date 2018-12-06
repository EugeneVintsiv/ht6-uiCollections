//
//  ViewController.swift
//  HT6-UICollections
//
//  Created by Eugene on 05.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var countLabel: UILabel!

    @IBAction func addNewNote(_ sender: Any) {
        let newCellInfo = CellData.init(title: generateRandomString(8), description: generateRandomString(64), creationDate: getFormatterCurrentDate())
        elements[0].append(newCellInfo)
        updateTableContent()
    }
    
    let sections = ["top", "bottom"]
    var elements: [[CellData]] = [[
        CellData.init(title: "Title1", description: "Description1", creationDate: "2018-01-01"),
//        CellData.init(title: "Title2", description: "Description2", creationDate: "2018-01-02"),
//        CellData.init(title: "Title3", description: "Description3", creationDate: "2018-01-03"),
        CellData.init(title: "Title4", description: "Description4", creationDate: "2018-01-04")
    ], []]

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
//        elements = defaultElements()
        updateTableContent()
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

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            elements.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateTableContent()
        }
    }
}

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPathForCell: IndexPath) {
        print("didSelectRowAtIndexPath \(indexPathForCell)")
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath indexPathForCell: NSIndexPath) {
        print("moveRowAtIndexPath: \(indexPathForCell)")
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAtindexPath: IndexPath) {
//
//        if indexPath.section == 0 {
//            var section = elements[0]
//            let objectToMove = section[indexPath.row]
//
//            tableView.beginUpdates()
//            var sectionToMove = elements[1]
//            sectionToMove.append(objectToMove)
//            section.remove(at: indexPath.row)
//
//            let newIndexPath = NSIndexPath(forRow: find(section, objectToMove)!, inSection: 1)
//
//            tableView.moveRowAtIndexPath(indexPath, toIndexPath: newIndexPath)
//            tableView.endUpdates()
//        }
//    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
//        print("didSelectRowAtIndexPath")
//
//        if indexPath.section == 0 {
//            var section = elements[0]
//            let objToMove = section[indexPath.row]
//
//            tableView.beginUpdates()
//            elements[1].append(objToMove)
//            section.remove(at: indexPath.row)
//        } else {
//            var section = elements[1]
//            let objToMove = section[indexPath.row]
//
//            tableView.beginUpdates()
//            elements[0].append(objToMove)
//            section.remove(at: indexPath.row)
//        }
//
    
}

// MARK: - HandleTableContent
extension NotesViewController {
    private func updateTableContent() {
        tableView.reloadData()
        updateCountLabel()
    }

    private func updateCountLabel() {
        countLabel.text = "Count: \(elements.count)"
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

    private func defaultElements() -> [CellData] {
        return [
            CellData.init(title: "Title1", description: "Description1", creationDate: "2018-01-01"),
            CellData.init(title: "Title2", description: "Description2", creationDate: "2018-01-02"),
            CellData.init(title: "Title3", description: "Description3", creationDate: "2018-01-03"),
            CellData.init(title: "Title4", description: "Description4", creationDate: "2018-01-04")
        ]
    }
}

