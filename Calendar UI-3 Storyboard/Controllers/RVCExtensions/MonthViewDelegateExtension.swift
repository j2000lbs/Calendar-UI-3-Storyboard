//
//  RootViewControllerMVDExtension.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

extension RootViewController: MonthViewDelegate {
	
	// I think I can eliminate passing data in.
	func didChange(month monthNumber: Int, year: Int) {
		
		// Not needed as property.currentMonthNumber is what is passed in same for year
//		propertyDelegate.currentMonthNumber = monthNumber + 1
//		propertyDelegate.currentYear = year
		
		/* for leap year, make february month of 29 days. February == 2.  1 is subtracted from monthNumber to access the array numOfDaysInMonth */
		if monthNumber == 2 {
			if helper.isLeapYear(currentYear: propertyDelegate.currentYear) {
				propertyDelegate.numOfDaysInMonth[monthNumber - 1] = 29
			} else {
				propertyDelegate.numOfDaysInMonth[monthNumber - 1] = 28
			}
		}

		propertyDelegate.firstDayOfMonth = getFirstDayOfMonth()

		calendarCollectionView.reloadData()

		previousMonthButton.isEnabled =
			!(propertyDelegate.currentMonthNumber == propertyDelegate.presentMonthIndex &&
				propertyDelegate.currentYear == propertyDelegate.presentYear)
	}
}
