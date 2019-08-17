//
//  ViewController.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/16/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var sundayLabel: UILabel!
	@IBOutlet weak var mondayLabel: UILabel!
	@IBOutlet weak var tuesdayLabel: UILabel!
	@IBOutlet weak var wednesdayLabel: UILabel!
	@IBOutlet weak var thursdayLabel: UILabel!
	@IBOutlet weak var fridayLabel: UILabel!
	@IBOutlet weak var saturdayLabel: UILabel!
	
	@IBOutlet weak var monthYearLabel: UILabel!
	
	@IBOutlet weak var calendarCollectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Joel's Schedule"
		self.navigationController?.navigationBar.isTranslucent = false
//		self.view.backgroundColor = Style.backgroundColor
	}


}

