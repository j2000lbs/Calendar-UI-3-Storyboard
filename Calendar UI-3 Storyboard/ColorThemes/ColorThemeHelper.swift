//
//  ColorThemeHelper.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/18/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

struct ColorThemeHelper {
	
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	func changeLightTheme(visibleCells: [UICollectionViewCell]) {
		
		let rootViewController = getRootViewController()
		
		let dayLabels = makeDayLabelArray()
		
		rootViewController.previousMonthButton.setTitleColor(Style.previousMonthButtonColor,
															 for: .normal)
		rootViewController.nextMonthButton.setTitleColor(Style.nextMonthButtonColor,
														 for: .normal)
		rootViewController.monthYearLabel.textColor = Style.monthYearLabelColor
		
		for daylabel in dayLabels {
			daylabel.textColor = Style.dayNameLabelColor
		}
		
		/* The following loop will set all of the cells of the dates of the month that are that haven't passed, therefore UserInteraction is enabled, to the deselected value.  The selected cell, if there is one, will remain with the selected values. */
		for cell in visibleCells {
			guard let dateCell = cell as? CalendarViewCell
				else { return }
			if dateCell.isUserInteractionEnabled && !dateCell.isSelected {
				dateCell.dateCellLabel.textColor = Style.deselecttedCellLabelTextColor
			}
		}
	}
	
	private func makeDayLabelArray() -> [UILabel] {
		
		let rootViewController = getRootViewController()
		
		return [rootViewController.sundayLabel, rootViewController.mondayLabel,
				rootViewController.tuesdayLabel, rootViewController.wednesdayLabel,
				rootViewController.thursdayLabel, rootViewController.fridayLabel,
				rootViewController.saturdayLabel]
	}
	
	private func getRootViewController() -> RootViewController {
		let navViewController =
			appDelegate.window?.rootViewController as! UINavigationController
		return navViewController.viewControllers[0] as! RootViewController
	}
}
