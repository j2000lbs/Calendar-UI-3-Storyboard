//
//  String+date.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 9/1/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


extension String {
	var date: Date? {
		return String.dateFormatter.date(from: self)
	}
}
