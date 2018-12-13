//
//  CalendarViewController.swift
//  HT6-UICollections
//
//  Created by Eugene on 13.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class CalendarViewController: UICollectionViewController {

    let months: [MonthItem] = [
        /*1*/ MonthItem(monthName: "January", daysCount: 31),
        /*2*/ MonthItem(monthName: "February", daysCount: 29),
        /*3*/ MonthItem(monthName: "March", daysCount: 31),
        /*4*/ MonthItem(monthName: "April", daysCount: 30),
        /*5*/ MonthItem(monthName: "May", daysCount: 31),
        /*6*/ MonthItem(monthName: "June", daysCount: 30),
        /*7*/ MonthItem(monthName: "July", daysCount: 31),
        /*8*/ MonthItem(monthName: "August", daysCount: 31),
        /*9*/ MonthItem(monthName: "September", daysCount: 30),
        /*10*/MonthItem(monthName: "October", daysCount: 31),
        /*11*/ MonthItem(monthName: "November", daysCount: 30),
        /*12*/ MonthItem(monthName: "December", daysCount: 31)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
