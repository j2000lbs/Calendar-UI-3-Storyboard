//
//  MyCalendar.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/21/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


struct MyCalendar {
	
	static var theme = ColorStyle.ColorThemes.nightSky
	static let monthNames = ["January", "February", "March", "April", "May", "June", "July",
					  "August", "September", "October", "November", "December"]
	static var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	static var currentMonthNumber = 0
	static var currentYear = 0
	static var presentMonthIndex = 0
	static var presentYear = 0
	static var todaysDate = 0
	static var firstDayOfMonth = 0
	static var previouslySelectedCellDate: String?
	static let numberOfColumns = 7   			// 7 days in a week
	static let numberOfColumnSpaces = 8
	
	
	// Method to determine leap year
	static func isLeapYear(currentYear: Int) -> Bool {
		return currentYear % 4 == 0 && currentYear % 100 != 0 ||
			currentYear % 400 == 0
	}
	
	//  Returns the name of a month based on the month's number 1 - 12
	static func getMonthName(monthIndex: Int) -> String {
		return monthNames[monthIndex - 1]
	}
}
