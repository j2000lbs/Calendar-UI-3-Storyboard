//
//  CalendarHelpers.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation

struct CalendarHelpers {
	
	// Method to determine leap year
	func isLeapYear(currentYear: Int) -> Bool {
		return currentYear % 4 == 0 && currentYear % 100 != 0 ||
			currentYear % 400 == 0
	}
	
	//  Returns the name of a month based on the month's number 1 - 12
	func getMonthName(monthIndex: Int) -> String {
		return CalendarProperties().monthNames[monthIndex - 1]
	}
}
