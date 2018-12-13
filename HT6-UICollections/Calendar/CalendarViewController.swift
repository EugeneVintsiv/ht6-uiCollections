//
//  CalendarViewController.swift
//  HT6-UICollections
//
//  Created by Eugene on 13.12.18.
//  Copyright © 2018 Eugene. All rights reserved.
//

import UIKit

class CalendarViewController: UICollectionViewController {

    let cacheNums = Array<Int>(1...31)

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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return months.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return months[section].daysCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarDayNumberCell.reuseIdentifier, for: indexPath) as! CalendarDayNumberCell
        cell.dayOfMonthLabel.text = String(getDayNumber(indexPath.item))
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CalendarMonthHeader.reuseIdentifier, for: indexPath) as! CalendarMonthHeader
        headerView.monthHeader.text = months[indexPath.section].monthName
        return headerView
    }

    private func getDayNumber(_ searchIndex: Int) -> Int {
        return cacheNums[searchIndex]
    }
}
