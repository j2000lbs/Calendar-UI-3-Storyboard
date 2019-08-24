//
//  RootViewControllerMVDExtension.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

extension RootViewController: MonthViewDelegate {
	
	func didChange(month monthIndex: Int, year: Int) {
		
		propertyDelegate.currentMonthIndex = monthIndex + 1
		propertyDelegate.currentYear = year
		
		//for leap year, make february month of 29 days
		if monthIndex == 1 {
			if helper.isLeapYear(currentYear: propertyDelegate.currentYear) {
				propertyDelegate.numOfDaysInMonth[monthIndex] = 29
			} else {
				propertyDelegate.numOfDaysInMonth[monthIndex] = 28
			}
		}

		propertyDelegate.firstDayOfMonth = getFirstDayOfMonth()

		calendarCollectionView.reloadData()

		previousMonthButton.isEnabled =
			!(propertyDelegate.currentMonthIndex == propertyDelegate.presentMonthIndex &&
				propertyDelegate.currentYear == propertyDelegate.presentYear)
	}
}
