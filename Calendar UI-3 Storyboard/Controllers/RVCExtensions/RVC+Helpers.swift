//
//  RootViewControllerHelperExt.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


extension RootViewController {
	
	// MARK: - Helper methods
	
	/* Method to retrieve the first day of a given month and year. 1 needs to be added to the index to access the current month from Date (the index is used in an array, Date is not. */
	func getFirstDayOfMonth() -> Int {
		let day =
			("\(propertyDelegate.currentMonthNumber)-01-\(propertyDelegate.currentYear)"
				.date?.firstDayOfMonth.dayOfWeek)!
		return day
	}
	
	
	/* Method to change the month displayed when using the previousMonth and nextMonth Buttons */
	func didChange(month monthNumber: Int, year: Int) {
		
		/* for leap year, make february month of 29 days. February == 2.  1 is subtracted from monthNumber to access the array numOfDaysInMonth */
		if monthNumber == 2 {
			if calendarHelpers.isLeapYear(currentYear: propertyDelegate.currentYear) {
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

