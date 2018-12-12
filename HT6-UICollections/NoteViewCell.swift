//
//  NoteViewCell.swift
//  HT6-UICollections
//
//  Created by Eugene on 06.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class NoteViewCell: UITableViewCell {
    static let reuseIdentifier = "cellItem"
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDate: UILabel!
    @IBOutlet weak var noteDescription: UILabel!
    
    @IBAction func onTitleChanged(_ sender: UITextField) {
        titleChangedCallback?(sender.text)
    }
    
    var titleChangedCallback: ((String?) -> ())?
    
}
