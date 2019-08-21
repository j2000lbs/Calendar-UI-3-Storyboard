//
//  ViewController.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/16/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
	
	@IBOutlet weak var sundayLabel: UILabel!
	@IBOutlet weak var mondayLabel: UILabel!
	@IBOutlet weak var tuesdayLabel: UILabel!
	@IBOutlet weak var wednesdayLabel: UILabel!
	@IBOutlet weak var thursdayLabel: UILabel!
	@IBOutlet weak var fridayLabel: UILabel!
	@IBOutlet weak var saturdayLabel: UILabel!
	@IBOutlet weak var monthYearLabel: UILabel!
	
	@IBOutlet weak var previousMonthButton: UIButton!
	@IBOutlet weak var nextMonthButton: UIButton!
	
	@IBOutlet weak var monthView: UIView!
	
	// may not need these since I have the one above
	
	@IBOutlet weak var daysStackView: UIStackView!
	@IBOutlet weak var calendarCollectionView: UICollectionView!
	
	var colorThemeHelper = ColorThemeHelper()
	let helper = Helpers()
	var calendarCollectionViewDataSource: CalendarCollectionViewDataSource!
	var calendarCollectionViewDelegate: CalendarCollectionViewDelegate!
	var propertyDelegate = CalendarProperties()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		calendarCollectionViewDelegate = CalendarCollectionViewDelegate()
		calendarCollectionViewDataSource = CalendarCollectionViewDataSource()
		
		
		if propertyDelegate.currentMonthIndex == 2 &&
					helper.isLeapYear(currentYear: propertyDelegate.currentYear) {
			propertyDelegate.numOfDaysInMonth[propertyDelegate.currentMonthIndex - 1] = 29
		}
		propertyDelegate.currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
		propertyDelegate.currentYear = Calendar.current.component(.year, from: Date())
		propertyDelegate.numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
		propertyDelegate.presentMonthIndex = Calendar.current.component(.month, from: Date())
		propertyDelegate.todaysDate = Calendar.current.component(.day, from: Date())
		propertyDelegate.presentMonthIndex = propertyDelegate.currentMonthIndex
		propertyDelegate.presentYear = propertyDelegate.currentYear
		propertyDelegate.firstDayOfMonth = getFirstDayOfMonth()   //(Sunday-Saturday 1-7)
		
		let dayLabels = [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel,
						 thursdayLabel, fridayLabel, saturdayLabel]
		
		self.title = "Joel's Schedule"
		Style.darkTheme()
		self.view.backgroundColor = Style.backgroundColor
		monthYearLabel.textColor = Style.monthYearLabelColor
		for dayLabel in dayLabels {
			dayLabel?.textColor = Style.dayNameLabelColor
		}
		
		previousMonthButton.isEnabled = false
		
		calendarCollectionView.dataSource = calendarCollectionViewDataSource
		calendarCollectionView.delegate = calendarCollectionViewDelegate
		
	}
	

	@IBAction func changeLightTheme(_ sender: UIBarButtonItem) {
		if propertyDelegate.theme == .dark {
			sender.title = "Dark"
			propertyDelegate.theme = .light
			Style.lightTheme()
		} else {
			sender.title = "Light"
			propertyDelegate.theme = .dark
			Style.darkTheme()
		}
		self.view.backgroundColor = Style.backgroundColor
		colorThemeHelper.changeLightTheme(visibleCells: calendarCollectionView.visibleCells)
	}
	
	
	@IBAction func previousMonthButton(_ sender: Any) {
		propertyDelegate.currentMonthIndex -= 1
		if propertyDelegate.currentMonthIndex < 0 {
			propertyDelegate.currentMonthIndex = 11
			propertyDelegate.currentYear -= 1
		}
		monthYearLabel.text =
			"\(propertyDelegate.monthNames[propertyDelegate.currentMonthIndex]) \(propertyDelegate.currentYear)"
		didChange(month: propertyDelegate.currentMonthIndex, year: propertyDelegate.currentYear)
	}
	
	
	@IBAction func nextMonthButton(_ sender: Any) {
		propertyDelegate.currentMonthIndex += 1
		if propertyDelegate.currentMonthIndex > 11 {
			propertyDelegate.currentMonthIndex = 0
			propertyDelegate.currentYear += 1
		}
		monthYearLabel.text="\(propertyDelegate.monthNames[propertyDelegate.currentMonthIndex]) \(propertyDelegate.currentYear)"
		didChange(month: propertyDelegate.currentMonthIndex, year: propertyDelegate.currentYear)
	}
	
}

