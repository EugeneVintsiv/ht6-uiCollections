//
//  CellData.swift
//  HT6-UICollections
//
//  Created by Eugene on 06.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import Foundation

struct CellData: Equatable {
    var title: String
    var description: String
    var creationDate: String
    var isCompleted: Bool

    init() {
        self.init(title: "", description: "", creationDate: "", isCompleted: false)
    }
    
    init(title: String, description: String, creationDate: String) {
        self.init(title: title, description: description, creationDate: creationDate, isCompleted: false)
    }

    init(title: String, description: String, creationDate: String, isCompleted: Bool) {
        self.title = title
        self.description = description
        self.creationDate = creationDate
        self.isCompleted = isCompleted
    }

}
