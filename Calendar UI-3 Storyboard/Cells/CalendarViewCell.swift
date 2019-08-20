//
//  CalendarViewCell.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/17/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarViewCell: UICollectionViewCell {
	
	@IBOutlet var dateCellLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		dateCellLabel.textColor = Style.deselecttedCellLabelTextColor
	}
	
	
}
