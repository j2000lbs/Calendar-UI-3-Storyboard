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
	@IBOutlet weak var rightBarButtomItem: UIBarButtonItem!
	
	@IBOutlet weak var calendarView: UIView!
	@IBOutlet weak var calendarCollectionView: UICollectionView!
	
	var myCalendar = MyCalendar()
	var colorThemeHelper: ColorThemeHelper!
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
		Style.darkTheme()
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
		
		myCalendar.currentMonthNumber = Calendar.current.component(.month, from: Date())
		myCalendar.currentYear = Calendar.current.component(.year, from: Date())
		myCalendar.presentMonthIndex = Calendar.current.component(.month, from: Date())
		myCalendar.todaysDate = Calendar.current.component(.day, from: Date())
		myCalendar.presentMonthIndex = myCalendar.currentMonthNumber
		myCalendar.presentYear = myCalendar.currentYear
		myCalendar.firstDayOfMonth = getFirstDayOfMonth()   //(Sunday-Saturday 1-7)
		
		// For leap year make February have 29 days
		if myCalendar.currentMonthNumber == 2 &&
			myCalendar.isLeapYear(currentYear: myCalendar.currentYear) {
			myCalendar.numOfDaysInMonth[myCalendar.currentMonthNumber - 1] = 29
		}
		
		self.title = "Joel's Schedule"
		self.view.backgroundColor = Style.backgroundColor
		monthYearLabel.textColor = Style.monthYearLabelColor
		monthYearLabel.text =
		"\(myCalendar.getMonthName(monthIndex: myCalendar.presentMonthIndex)) \(myCalendar.presentYear)"
		for dayLabel in dayLabels {
			dayLabel.textColor = Style.dayNameLabelColor
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
		colorThemeHelper = ColorThemeHelper()
		calendarCollectionView.dataSource = calendarCollectionViewDataSource
		calendarCollectionView.delegate = calendarCollectionViewDelegate
		
		let font = UIFont.systemFont(ofSize: 20)
		rightBarButtomItem.setTitleTextAttributes([NSAttributedString.Key(rawValue:
			NSAttributedString.Key.font.rawValue): font], for: .normal)
	}
	

	@IBAction func changeLightTheme(_ sender: UIBarButtonItem) {
		if myCalendar.theme == .dark {
			sender.title = "Dark"
			myCalendar.theme = .light
			Style.lightTheme()
		} else {
			sender.title = "Light"
			myCalendar.theme = .dark
			Style.darkTheme()
		}
		self.view.backgroundColor = Style.backgroundColor
		colorThemeHelper.changeLightTheme(visibleCells: calendarCollectionView.visibleCells)
	}
	
	
	@IBAction func previousMonthButton(_ sender: Any) {
		myCalendar.currentMonthNumber -= 1
		if myCalendar.currentMonthNumber < 1 {
			myCalendar.currentMonthNumber = 12
			myCalendar.currentYear -= 1
		}
		//  Added - 1 to access the correct month name from the array
		monthYearLabel.text =
			"\(myCalendar.monthNames[myCalendar.currentMonthNumber - 1]) \(myCalendar.currentYear)"
		didChange(month: myCalendar.currentMonthNumber, year: myCalendar.currentYear)
	}
	
	
	@IBAction func nextMonthButton(_ sender: Any) {
		myCalendar.currentMonthNumber += 1
		if myCalendar.currentMonthNumber > 12 {
			myCalendar.currentMonthNumber = 1
			myCalendar.currentYear += 1
		}
		//  Added - 1 to access the correct month name from the array
		monthYearLabel.text="\(myCalendar.monthNames[myCalendar.currentMonthNumber - 1]) \(myCalendar.currentYear)"
		didChange(month: myCalendar.currentMonthNumber, year: myCalendar.currentYear)
	}
	
	
	
}





