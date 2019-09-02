//
//  MyCalendar.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/21/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


struct MyCalendar {
	
	var theme = LightThemes.dark
	let monthNames = ["January", "February", "March", "April", "May", "June", "July",
					  "August", "September", "October", "November", "December"]
	var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	var currentMonthNumber = 0
	var currentYear = 0
	var presentMonthIndex = 0
	var presentYear = 0
	var todaysDate = 0
	var firstDayOfMonth = 0
	var previouslySelectedCellDate: String?
	let numberOfColumns = 7   			// 7 days in a week
	let numberOfColumnSpaces = 8
	
	
	// Method to determine leap year
	func isLeapYear(currentYear: Int) -> Bool {
		return currentYear % 4 == 0 && currentYear % 100 != 0 ||
			currentYear % 400 == 0
	}
	
	//  Returns the name of a month based on the month's number 1 - 12
	func getMonthName(monthIndex: Int) -> String {
		return monthNames[monthIndex - 1]
	}
}
