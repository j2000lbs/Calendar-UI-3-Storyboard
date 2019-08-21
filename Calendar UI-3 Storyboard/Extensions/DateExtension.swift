//
//  DateExtension.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


extension Date {
	var dayOfWeek: Int {
		return Calendar.current.component(.weekday, from: self)
	}
	
	var firstDayOfMonth: Date {
		return Calendar.current.date(from:
			Calendar.current.dateComponents([.year, .month], from: self))!
	}
}
