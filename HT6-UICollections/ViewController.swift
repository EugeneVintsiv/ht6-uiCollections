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
    var elements = [CellData]()
    
    override func viewDidLoad() {
        addButton.isHidden = true
        super.viewDidLoad()
        elements = [
            CellData.init(title: "Title1", description: "Description1", creationDate: "2018-01-01"),
            CellData.init(title: "Title2", description: "Description2", creationDate: "2018-01-02"),
            CellData.init(title: "Title3", description: "Description3", creationDate: "2018-01-03"),
            CellData.init(title: "Title4", description: "Description4", creationDate: "2018-01-04")
        ]
        
        print(elements.count)
        let cellNib = UINib(nibName: "NoteViewCell", bundle: nil)
        print(cellNib)
        tableView.register(cellNib, forCellReuseIdentifier: NoteViewCell.reuseIdentifier)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteViewCell.reuseIdentifier, for: indexPath) as! NoteViewCell
        
        cell.backgroundColor = UIColor.green
        cell.noteTitle.text = elements[indexPath.row].title
        cell.noteDate.text = elements[indexPath.row].creationDate
        cell.noteDescription.text = elements[indexPath.row].description
        
        return cell
    }
}

