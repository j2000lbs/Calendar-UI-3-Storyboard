//
//  CalendarCollectionViewLayout.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/22/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

class CalendarCollectionViewLayout: UICollectionViewLayout {
	
	/* The size of each item is determined by the size of the screen it is viewed on.  There will be 7 columns, one for each day of the week.  One point will spearate each cell, so 8 is subtracted.  Each cell will be square so the sides are equal. For iPhone 8 it needs to be 52x52 */
	private var itemSize: CGSize!					//CGSize(width: 52, height: 52)
		
//		CGSize(width: ((UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! RootViewController).calendarCollectionView.frame.width / 7 - 6,
//			height: ((UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! RootViewController).calendarCollectionView.frame.width / 7 - 6)
	
	private let itemSpacing : CGFloat = 1
	private var numberOfItems = 0
	private var numberOfRows = 0
	private let numberOfColumns = 7		// Seven days in a week
	
	private var layoutAttributes = [UICollectionViewLayoutAttributes]()
	
	
	
	override var collectionViewContentSize: CGSize {
		let width =
			CGFloat(numberOfColumns) * itemSize.width * CGFloat(numberOfColumns - 1) * itemSpacing
		let height = width
		
		return CGSize(width: width, height: height)
	}
	
	
	override func prepare() {
		
		guard let collectionView = self.collectionView
			else {
				print("collectionView was nil in prepare()")
				return
			}
		
		itemSize = CGSize(width: ((UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as!
			RootViewController).calendarCollectionView.frame.width / 7 - 1,
				  height: ((UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! RootViewController).calendarCollectionView.frame.width / 7 - 1)

		print(((UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! RootViewController).calendarCollectionView.frame.width / 7 - 6)
		
		numberOfItems = collectionView.numberOfItems(inSection: 0)
		// The following statement will return the rounded up integer x+y-1/y
		numberOfRows = (numberOfItems + 6) / 7 		// 7 columns, 7 days in a week
		
		layoutAttributes.removeAll()
		
		layoutAttributes = (0..<numberOfItems).map { itemIndex in
			let row = itemIndex % numberOfColumns
			let column = itemIndex / numberOfColumns
			
			let xPosition = row * Int(itemSize.width + itemSpacing)
			let yPosition = column * Int(itemSize.height + itemSpacing)
			
			let indexPath = IndexPath(row: itemIndex, section: 0)
			let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
			attributes.frame = CGRect(x: CGFloat(xPosition),
									  y: CGFloat(yPosition),
									  width: itemSize.width,
									  height: itemSize.height)
			return attributes
		}
	}
	
	
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		guard let collectionView = self.collectionView
			else {
				print("collectionView was nil in shouldInvalidate")
				return true
			}
		
		let availableHeight = newBounds.height - collectionView.contentInset.top -
			collectionView.contentInset.bottom
		let possibleRows = Int(availableHeight + itemSpacing) / Int(itemSize.height + itemSpacing)
		
		return possibleRows != numberOfRows
	}
	
	
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		return layoutAttributes.filter { attributes in
			return attributes.frame.intersects(rect)
		}
	}
	
	
	override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
		return layoutAttributes[indexPath.row]
	}
	
}

