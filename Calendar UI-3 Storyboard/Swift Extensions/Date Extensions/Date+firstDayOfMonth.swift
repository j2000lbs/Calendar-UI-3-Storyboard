//
//  Date+firstDayOfMonth.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 9/1/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


extension Date {
	var firstDayOfMonth: Date {
		return Calendar.current.date(from:
			Calendar.current.dateComponents([.year, .month], from: self))!
	}
}
