//
//  CalendarCollectionViewDataSource.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarCollectionViewDataSource: NSObject, UICollectionViewDataSource {
	
	let rootViewController =
		(UIApplication.shared.keyWindow?.rootViewController as!
			UINavigationController).viewControllers.first as! RootViewController
	
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		 var propertyDelegate = rootViewController.propertyDelegate
		return propertyDelegate.numOfDaysInMonth[propertyDelegate.currentMonthNumber - 1] +
			propertyDelegate.firstDayOfMonth - 1
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let propertyDelegate = rootViewController.propertyDelegate
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCell",
													  for: indexPath) as! CalendarViewCell
		cell.backgroundColor = UIColor.clear
		if indexPath.item <= propertyDelegate.firstDayOfMonth - 2 {
			cell.isHidden = true
		} else {
			let calculateDate = indexPath.row - propertyDelegate.firstDayOfMonth + 2
			cell.isHidden = false
			cell.dateCellLabel.text = "\(calculateDate)"
			if calculateDate < propertyDelegate.todaysDate &&
				propertyDelegate.currentYear == propertyDelegate.presentYear &&
				propertyDelegate.currentMonthNumber == propertyDelegate.presentMonthIndex {

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
