//
//  MonthViewDelegate.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import Foundation


protocol MonthViewDelegate: class {
	func didChange(month monthIndex: Int, year:Int)
}
