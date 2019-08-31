//
//  RootViewControllerHelperExt.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


extension RootViewController {
	
	/* Method to retrieve the first day of a given month and year. 1 needs to be added to the index to access the current month from Date (the index is used in an array, Date is not. */
	func getFirstDayOfMonth() -> Int {
		let day =
			("\(propertyDelegate.currentMonthNumber)-01-\(propertyDelegate.currentYear)"
				.date?.firstDayOfMonth.dayOfWeek)!
		return day
	}
}

