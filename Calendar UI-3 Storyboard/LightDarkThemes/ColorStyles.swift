//
//  ColorStyles.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/18/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit


struct ColorStyle {
	
	enum ColorThemes {
		case skyBlue
		case nightSky
	}
	
	struct Colors {
		static var skyBlue = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
		static var nightSky = #colorLiteral(red: 0.08967345208, green: 0.2006737888, blue: 0.6619026065, alpha: 1)
	}
	
	
	static var backgroundColor = UIColor.white
	static var monthYearLabelColor = UIColor.white
	static var nextMonthButtonColor = UIColor.white
	static var previousMonthButtonColor = UIColor.white
	static var deselectedCellLabelTextColor = UIColor.clear
	static var selectedCellLabelTextColor = UIColor.white
	static var selectedCellBackgroundColor = Colors.nightSky
	static var dayNameLabelColor = UIColor.white
	
	static func nightSkyTheme() {
		backgroundColor = Colors.nightSky
		monthYearLabelColor = UIColor.white
		nextMonthButtonColor = UIColor.white
		previousMonthButtonColor = UIColor.white
		deselectedCellLabelTextColor = UIColor.white
		selectedCellLabelTextColor = UIColor.black
		selectedCellBackgroundColor = Colors.skyBlue
		dayNameLabelColor = UIColor.white
	}
	
	static func skyBlueTheme() {
		backgroundColor = Colors.skyBlue
		monthYearLabelColor = UIColor.black
		nextMonthButtonColor = UIColor.black
		previousMonthButtonColor = UIColor.black
		deselectedCellLabelTextColor = UIColor.black
		selectedCellLabelTextColor = UIColor.white
		selectedCellBackgroundColor = Colors.nightSky
		dayNameLabelColor = UIColor.black
	}
}
