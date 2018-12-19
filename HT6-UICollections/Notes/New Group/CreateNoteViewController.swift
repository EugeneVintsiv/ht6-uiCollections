//
//  CreateNoteViewController.swift
//  HT6-UICollections
//
//  Created by Eugene on 19.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController {

    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDescription: UITextField!
    @IBOutlet weak var noteDate: UITextField!
    @IBOutlet weak var noteCompletedSwitcher: UISwitch!

    var onSaveAction: ((CellData) -> ())?

    override func viewDidLoad() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.title = "Create Note"
    }

    @objc func saveNote() {
        let cellData = CellData(title: getTextOrDefault(noteTitle),
                description: getTextOrDefault(noteDescription),
                creationDate: getTextOrDefault(noteDate),
                isCompleted: noteCompletedSwitcher.isOn)
        onSaveAction?(cellData);
        navigationController?.popViewController(animated: true)
    }

    private func getTextOrDefault(_ textField: UITextField) -> String {
        return textField.text ?? ""
    }
}
