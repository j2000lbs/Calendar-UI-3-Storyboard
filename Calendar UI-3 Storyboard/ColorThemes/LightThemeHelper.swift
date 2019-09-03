//
//  LightThemeHelper.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/18/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

struct LightThemeHelper {
	
	let calendarViewController = (UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! CalendarViewController
	
	// Method used to change Light/Dark Theme
	func changeLightTheme(visibleCells: [UICollectionViewCell]) {
		
		guard let dayLabels = calendarViewController.dayLabels else {
			print("dayLabels was nil in changeLightTheme()")
			return }
		
		calendarViewController.previousMonthButton.setTitleColor(Style.previousMonthButtonColor,
															 for: .normal)
		calendarViewController.nextMonthButton.setTitleColor(Style.nextMonthButtonColor,
														 for: .normal)
		calendarViewController.monthYearLabel.textColor = Style.monthYearLabelColor
		
		for daylabel in dayLabels {
			daylabel.textColor = Style.dayNameLabelColor
		}
		
		/* The following loop will set all of the cells of the dates of the month that haven't passed, therefore UserInteraction is enabled, to the deselected value.  The selected cell, if there is one, will remain with the selected values. */
		for cell in visibleCells {
			guard let dateCell = cell as? CalendarViewCell
				else { return }
			if dateCell.isUserInteractionEnabled && !dateCell.isSelected {
				dateCell.dateCellLabel.textColor = Style.deselecttedCellLabelTextColor
			}
			if dateCell.isSelected {
				dateCell.backgroundColor = Style.selectedCellBackgroundColor
				dateCell.dateCellLabel.textColor = Style.selectedCellLabelTextColor
			}
		}
	}
}
