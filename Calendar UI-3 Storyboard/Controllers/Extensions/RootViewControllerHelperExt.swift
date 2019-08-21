//
//  RootViewControllerHelperExt.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


extension RootViewController {
	
	func getFirstDayOfMonth() -> Int {
		let day =
			("\(propertyDelegate.currentMonthIndex)-01-\(propertyDelegate.currentYear)".date?.firstDayOfMonth.dayOfWeek)!
		return day
	}
}
