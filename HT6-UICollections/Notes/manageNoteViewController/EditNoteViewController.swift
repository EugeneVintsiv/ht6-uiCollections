//
// Created by Eugene on 19.12.18.
// Copyright (c) 2018 Eugene. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {
    static let viewIdentifier = "EditNoteViewController"

    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDescription: UITextField!
    @IBOutlet weak var noteDatePicker: UIDatePicker!
    @IBOutlet weak var noteCompletedSwitcher: UISwitch!
    var nodeData: CellData?
    var onEndEditAction: ((CellData) -> ())?

    private let dateFormat = "yyyy-MM-dd"
    private var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(endEditNote))
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.title = "Edit \(nodeData!.title)"
        dateFormatter.dateFormat = dateFormat

        setupViews()
        super.viewDidLoad()
    }

    @objc func endEditNote() {
        let cellData = CellData(title: getTextOrDefault(noteTitle),
                description: getTextOrDefault(noteDescription),
                creationDate: dateFormatter.string(from: noteDatePicker.date),
                isCompleted: noteCompletedSwitcher.isOn)

        onEndEditAction?(cellData)
        navigationController?.popViewController(animated: true)
    }

    private func setupViews() {
        guard let title = nodeData?.title,
              let description = nodeData?.description,
              let noteCreatedDate = nodeData?.creationDate,
              let isCompleted = nodeData?.isCompleted
                else { return }

        noteTitle.text = title
        noteDescription.text = description
        noteDatePicker.date = dateFormatter.date(from: noteCreatedDate)!
        noteCompletedSwitcher.isOn = isCompleted
    }

    private func getTextOrDefault(_ textField: UITextField) -> String {
        return textField.text ?? ""
    }

}
