//
//  CalendarCollectionViewDelegate.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/20/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarCollectionViewDelegate: NSObject, UICollectionViewDelegate,
												UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView,
						shouldSelectItemAt indexPath: IndexPath) -> Bool {
		
		let date = collectionView.cellForItem(at: indexPath)
		if date?.isSelected ?? false {
			collectionView.deselectItem(at: indexPath, animated: false)
			guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarViewCell
				else { return false }
			cell.backgroundColor = UIColor.clear
			cell.dateCellLabel.textColor = ColorStyle.deselectedCellLabelTextColor
		} else {
			return true
		}
		return false
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						didSelectItemAt indexPath: IndexPath) {
		guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarViewCell
			else { return }
		cell.backgroundColor = ColorStyle.selectedCellBackgroundColor
		cell.dateCellLabel.textColor = ColorStyle.selectedCellLabelTextColor
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						didDeselectItemAt indexPath: IndexPath) {
		
		guard let cell = collectionView.cellForItem(at: indexPath) as? CalendarViewCell
			else { return }
		cell.backgroundColor = UIColor.clear
		cell.dateCellLabel.textColor = ColorStyle.deselectedCellLabelTextColor
	}
	
	
	// This method works for iPhone 8, iPad 9.7" Portrait & Landscape
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
		let numberOfColumns = CGFloat(MyCalendar.numberOfColumns)
		let numberOfColumnSpaces =
			CGFloat(MyCalendar.numberOfColumnSpaces)
		
		let side = (collectionView.frame.width / numberOfColumns) - numberOfColumnSpaces
		return CGSize(width: side, height: side)
	}
	
	
	func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 8.0
	}
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 8.0
	}
	
}
