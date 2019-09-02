//
//  CalendarViewCell.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/17/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarViewCell: UICollectionViewCell {
	
	@IBOutlet weak var dateCellLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		// pretty sure this is not needed now...leave for a few days to  make sure 9/2/2019
//		dateCellLabel.textColor = Style.deselecttedCellLabelTextColor
	}
	
	
}
