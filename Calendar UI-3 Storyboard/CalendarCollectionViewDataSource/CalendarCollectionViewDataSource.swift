//
//  CalendarCollectionViewDataSource.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		return MyCalendar.numOfDaysInMonth[MyCalendar.currentMonthNumber - 1] +
			MyCalendar.firstDayOfMonth - 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell",
													  for: indexPath) as! CalendarViewCell
		cell.backgroundColor = UIColor.clear
		if indexPath.item <= MyCalendar.firstDayOfMonth - 2 {
			cell.isHidden = true
		} else {
			let calculateDate = indexPath.row - MyCalendar.firstDayOfMonth + 2
			cell.isHidden = false
			cell.dateCellLabel.text = "\(calculateDate)"
			if calculateDate < MyCalendar.todaysDate &&
				MyCalendar.currentYear == MyCalendar.presentYear &&
				MyCalendar.currentMonthNumber == MyCalendar.presentMonthIndex {

				cell.isUserInteractionEnabled = false
				cell.dateCellLabel.textColor = UIColor.lightGray
			} else {
				cell.isUserInteractionEnabled = true
				cell.dateCellLabel.textColor = Style.deselectedCellLabelTextColor
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
