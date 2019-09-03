//
//  CalendarCollectionViewDataSource.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	
	let calendarViewController =
		(UIApplication.shared.keyWindow?.rootViewController as!
			UINavigationController).viewControllers.first as! CalendarViewController
	
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		 var myCalendar = calendarViewController.myCalendar
		return myCalendar.numOfDaysInMonth[myCalendar.currentMonthNumber - 1] +
			myCalendar.firstDayOfMonth - 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		/* myCalendar is a constant here because its properties are accessed, not changed */
		let myCalendar = calendarViewController.myCalendar
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell",
													  for: indexPath) as! CalendarViewCell
		cell.backgroundColor = UIColor.clear
		if indexPath.item <= myCalendar.firstDayOfMonth - 2 {
			cell.isHidden = true
		} else {
			let calculateDate = indexPath.row - myCalendar.firstDayOfMonth + 2
			cell.isHidden = false
			cell.dateCellLabel.text = "\(calculateDate)"
			if calculateDate < myCalendar.todaysDate &&
				myCalendar.currentYear == myCalendar.presentYear &&
				myCalendar.currentMonthNumber == myCalendar.presentMonthIndex {

				cell.isUserInteractionEnabled = false
				cell.dateCellLabel.textColor = UIColor.lightGray
			} else {
				cell.isUserInteractionEnabled = true
				cell.dateCellLabel.textColor = Style.deselecttedCellLabelTextColor
				/* The following if-statement sets the correct cell background color of a selected cell after scrolling and/or changing orientation. */
				if cell.isSelected {
					cell.backgroundColor = Style.selectedCellBackgroundColor
					cell.dateCellLabel.textColor = Style.selectedCellLabelTextColor
				}
			}
		}
		return cell
	}
	
	
	
}
