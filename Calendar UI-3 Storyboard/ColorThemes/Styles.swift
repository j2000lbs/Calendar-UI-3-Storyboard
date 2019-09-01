//
//  Styles.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/18/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit


struct Style {
	static var backgroundColor = UIColor.white
	static var monthYearLabelColor = UIColor.white
	static var nextMonthButtonColor = UIColor.white
	static var previousMonthButtonColor = UIColor.white
	static var deselecttedCellLabelTextColor = UIColor.clear			// was .white
	static var selectedCellLabelTextColor = UIColor.white
	static var selectedCellBackgroundColor = Colors.nightSky			// was .black
	static var dayNameLabelColor = UIColor.white
	
	static func darkTheme() {
		backgroundColor = Colors.nightSky
		monthYearLabelColor = UIColor.white
		nextMonthButtonColor = UIColor.white
		previousMonthButtonColor = UIColor.white
		deselecttedCellLabelTextColor = UIColor.white
		selectedCellLabelTextColor = UIColor.black
		selectedCellBackgroundColor = Colors.skyBlue  // used ot be UIColor.black
		dayNameLabelColor = UIColor.white
	}
	
	static func lightTheme() {
		backgroundColor = Colors.skyBlue
		monthYearLabelColor = UIColor.black
		nextMonthButtonColor = UIColor.black
		previousMonthButtonColor = UIColor.black
		deselecttedCellLabelTextColor = UIColor.black
		selectedCellLabelTextColor = UIColor.white
		selectedCellBackgroundColor = Colors.nightSky		// was .white
		dayNameLabelColor = UIColor.black
	}
}
