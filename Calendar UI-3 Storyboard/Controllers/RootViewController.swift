//
//  ViewController.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/16/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
	
	// might not need these day outlets
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
	
	var theme = LightThemes.dark
	var colorThemeHelper = ColorThemeHelper()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let dayLabels = [sundayLabel, mondayLabel, tuesdayLabel, wednesdayLabel,
						 thursdayLabel, fridayLabel, saturdayLabel]
		
		self.title = "Joel's Schedule"
		Style.darkTheme()
		self.view.backgroundColor = Style.backgroundColor
		monthYearLabel.textColor = Style.monthYearLabelColor
		for dayLabel in dayLabels {
			dayLabel?.textColor = Style.dayNameLabelColor
		}

	}
	

	@IBAction func changeLightTheme(_ sender: UIBarButtonItem) {
		if theme == .dark {
			sender.title = "Dark"
			theme = .light
			Style.lightTheme()
		} else {
			sender.title = "Light"
			theme = .dark
			Style.darkTheme()
		}
		self.view.backgroundColor = Style.backgroundColor
		colorThemeHelper.changeLightTheme(visibleCells: calendarCollectionView.visibleCells)
	}
	
}

