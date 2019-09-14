//
//  SkyNightThemeHelper.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/18/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

struct SkyBlueNightskyThemeHelper {
	
	let calendarViewController = (UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! CalendarViewController
	
	// Method used to change the Color Theme from Night Sky to Sky Blue and back
	func changeColorTheme(visibleCells: [UICollectionViewCell]) {
		
		guard let dayLabels = calendarViewController.dayLabels else {
			print("dayLabels was nil in changeColorTheme()")
			return }
		
		calendarViewController.previousMonthButton.setTitleColor(ColorStyle.previousMonthButtonColor,
															 for: .normal)
		calendarViewController.nextMonthButton.setTitleColor(ColorStyle.nextMonthButtonColor,
														 for: .normal)
		calendarViewController.monthYearLabel.textColor = ColorStyle.monthYearLabelColor
		calendarViewController.colorChangeButton.tintColor = ColorStyle.colorChangeButtonLabelColor
		
		for daylabel in dayLabels {
			daylabel.textColor = ColorStyle.dayNameLabelColor
		}
			
		
		/* The following loop will set all of the cells of the dates of the month that haven't passed, therefore UserInteraction is enabled, to the deselected value.  The selected cell, if there is one, will remain with the selected values, along with Today's date. */
		for cell in visibleCells {
			guard let dateCell = cell as? CalendarViewCell
				else { return }
			if dateCell.isUserInteractionEnabled && !dateCell.isSelected {
				dateCell.dateCellLabel.textColor = ColorStyle.deselectedCellLabelTextColor
			}
			if dateCell.isSelected {
				dateCell.backgroundColor = ColorStyle.selectedCellBackgroundColor
				dateCell.dateCellLabel.textColor = ColorStyle.selectedCellLabelTextColor
			}
			if dateCell.dateCellLabel.text == String(MyCalendar.todaysDate) &&
				MyCalendar.currentYear == MyCalendar.presentYear &&
				MyCalendar.currentMonthNumber == MyCalendar.presentMonthIndex {
				
				dateCell.backgroundColor = ColorStyle.todaysDateBackgroundColor
				dateCell.dateCellLabel.textColor = ColorStyle.todaysDateLabelTextColor
			}
		}
	}
}
