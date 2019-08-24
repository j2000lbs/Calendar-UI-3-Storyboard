//
//  PropertyDelegate.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/21/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


struct CalendarProperties {
	
	var theme = LightThemes.dark
	var monthNames = ["January", "February", "March", "April", "May", "June", "July",
					  "August", "September", "October", "November", "December"]
	var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	var currentMonthIndex = 0
	var currentYear = 0
	var presentMonthIndex = 0
	var presentYear = 0
	var todaysDate = 0
	var firstDayOfMonth = 0
	var previouslySelectedCellDate: String?
	
	func getMonthName(monthIndex: Int) -> String {
		return monthNames[monthIndex]
	}
}
