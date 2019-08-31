//
//  ColumnFlowLayout.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/25/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit


class ColumnFlowLayout: UICollectionViewFlowLayout {
	
	let cellsPerRow: Int
	
	init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 1,
		 minimumLineSpacing: CGFloat = 1, sectionInset: UIEdgeInsets = .zero) {
		self.cellsPerRow = cellsPerRow
		super.init()
		
		self.minimumInteritemSpacing = minimumInteritemSpacing
		self.minimumLineSpacing = minimumLineSpacing
		self.sectionInset = sectionInset
	}
	

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepare() {
		super.prepare()
		
//		let rootViewController = (UIApplication.shared.keyWindow!.rootViewController as! UINavigationController).viewControllers.first as! RootViewController
		
		let itemWidth = (collectionView!.bounds.size.width) / CGFloat(cellsPerRow) - 6
		itemSize = CGSize(width: itemWidth, height: itemWidth)
	}
	
	override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
		let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
		context.invalidateFlowLayoutDelegateMetrics =
			newBounds.size != collectionView?.bounds.size
		return context
	}
	
}


