//
//  ViewController.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/16/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
	
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
	@IBOutlet weak var colorChangeButton: UIBarButtonItem!	// color themes
	@IBOutlet weak var todayButton: UIBarButtonItem! // Today button
	
	@IBOutlet weak var calendarView: UIView!
	@IBOutlet weak var calendarCollectionView: UICollectionView!
	
	var skyBlueNightSkyThemeHelper: SkyBlueNightskyThemeHelper!
	var dayLabels: [UILabel]!
	var iPhoneLayout: [NSLayoutConstraint]!
	var iPadLayout: [NSLayoutConstraint]!
	var iPadLandscapeLayout : [NSLayoutConstraint]!
	
	// These will be defined in viewDidLoad so calendarViewController isn't nil when called
	var calendarCollectionViewDataSource: CalendarCollectionViewDataSource!
	var calendarCollectionViewDelegate: CalendarCollectionViewDelegate!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dayLabels = [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel,
						 thursdayLabel, fridayLabel, saturdayLabel]
		ColorStyle.nightSkyTheme()
		iPhoneLayout =
			[calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
			 calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
			 calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
			 calendarView.heightAnchor.constraint(equalToConstant: 380)]
		iPadLayout =
			[calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
			 calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
			 calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
			 calendarView.heightAnchor.constraint(equalToConstant: 670)]
		iPadLandscapeLayout =
			[calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
			 calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
			 calendarView.heightAnchor.constraint(equalToConstant: 600),
			 calendarView.widthAnchor.constraint(equalToConstant: 600)]
		
		MyCalendar.currentMonthNumber = Calendar.current.component(.month, from: Date())
		MyCalendar.currentYear = Calendar.current.component(.year, from: Date())
		MyCalendar.presentMonthIndex = Calendar.current.component(.month, from: Date())
		MyCalendar.todaysDate = Calendar.current.component(.day, from: Date())
		MyCalendar.presentMonthIndex = MyCalendar.currentMonthNumber
		MyCalendar.presentYear = MyCalendar.currentYear
		MyCalendar.firstDayOfMonth = getFirstDayOfMonth()   //(Sunday-Saturday 1-7)
		
		// For leap year make February have 29 days
		if MyCalendar.currentMonthNumber == 2 &&
			MyCalendar.isLeapYear(currentYear: MyCalendar.currentYear) {
			MyCalendar.numOfDaysInMonth[MyCalendar.currentMonthNumber - 1] = 29
		}
		
		self.title = "Joel's Schedule"
		self.view.backgroundColor = ColorStyle.backgroundColor
		monthYearLabel.textColor = ColorStyle.monthYearLabelColor
		monthYearLabel.text =
		"\(MyCalendar.getMonthName(monthIndex: MyCalendar.presentMonthIndex)) \(MyCalendar.presentYear)"
		for dayLabel in dayLabels {
			dayLabel.textColor = ColorStyle.dayNameLabelColor
		}
		
		/* the following if-else statement ensures the correct height is set for different devices. */
		if traitCollection.horizontalSizeClass == .regular &&
			traitCollection.verticalSizeClass == .regular {		// for iPad
			if UIDevice.current.orientation.isLandscape {
				print("Landscape")
				NSLayoutConstraint.deactivate(iPadLayout)
				NSLayoutConstraint.activate(iPadLandscapeLayout)
			} else {
				print("Portrait")
				NSLayoutConstraint.activate(iPadLayout)
			}
		} else {			// for iPhone
			NSLayoutConstraint.activate(iPhoneLayout)
		}
		
		previousMonthButton.isEnabled = false
		calendarCollectionView.allowsMultipleSelection = false
		previousMonthButton.setTitleColor(UIColor.lightGray, for: .disabled)
		
		// These have to be defined in viewDidLoad so calendarViewController isn't nil
		calendarCollectionViewDataSource = CalendarCollectionViewDataSource()
		calendarCollectionViewDelegate = CalendarCollectionViewDelegate()
		skyBlueNightSkyThemeHelper = SkyBlueNightskyThemeHelper()
		calendarCollectionView.dataSource = calendarCollectionViewDataSource
		calendarCollectionView.delegate = calendarCollectionViewDelegate
		
		let font = UIFont.systemFont(ofSize: 20)
		colorChangeButton.setTitleTextAttributes([NSAttributedString.Key(rawValue:
			NSAttributedString.Key.font.rawValue): font], for: .normal)
		todayButton.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): font], for: .normal)
	}
	

	@IBAction func changeColorTheme(_ sender: UIBarButtonItem) {
		if MyCalendar.theme == .nightSky {
			sender.title = "Night Sky"
			MyCalendar.theme = .skyBlue
			ColorStyle.skyBlueTheme()
		} else {
			sender.title = "Sky Blue"
			MyCalendar.theme = .nightSky
			ColorStyle.nightSkyTheme()
		}
		self.view.backgroundColor = ColorStyle.backgroundColor
		skyBlueNightSkyThemeHelper.changeColorTheme(visibleCells: calendarCollectionView.visibleCells)
	}
	
	
	// MARK - Add functionality here
	@IBAction func todayButton(_ sender: UIBarButtonItem) {
		MyCalendar.currentMonthNumber = Calendar.current.component(.month, from: Date())
		MyCalendar.currentYear = Calendar.current.component(.year, from: Date())
		MyCalendar.todaysDate = Calendar.current.component(.day, from: Date())
		//  - 1 used to access the correct month name from the array
		monthYearLabel.text =
		"\(MyCalendar.monthNames[MyCalendar.currentMonthNumber - 1]) \(MyCalendar.currentYear)"
		didChange(month: MyCalendar.currentMonthNumber, year: MyCalendar.currentYear)
		
		/* Add functionality to highlight today's day when Today button is tapped */
	}
	
	
	@IBAction func previousMonthButton(_ sender: Any) {
		MyCalendar.currentMonthNumber -= 1
		if MyCalendar.currentMonthNumber < 1 {
			MyCalendar.currentMonthNumber = 12
			MyCalendar.currentYear -= 1
		}
		//  - 1 used to access the correct month name from the array
		monthYearLabel.text =
			"\(MyCalendar.monthNames[MyCalendar.currentMonthNumber - 1]) \(MyCalendar.currentYear)"
		didChange(month: MyCalendar.currentMonthNumber, year: MyCalendar.currentYear)
	}
	
	
	@IBAction func nextMonthButton(_ sender: Any) {
		MyCalendar.currentMonthNumber += 1
		if MyCalendar.currentMonthNumber > 12 {
			MyCalendar.currentMonthNumber = 1
			MyCalendar.currentYear += 1
		}
		//  Added - 1 to access the correct month name from the array
		monthYearLabel.text="\(MyCalendar.monthNames[MyCalendar.currentMonthNumber - 1]) \(MyCalendar.currentYear)"
		didChange(month: MyCalendar.currentMonthNumber, year: MyCalendar.currentYear)
	}
	
	
	
}





