//
//  CVC+ViewWillTransition.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/25/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

extension CalendarViewController {
	
	override func viewWillTransition(to size: CGSize,
									 with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		
		// regular - regular size class is the iPad
		if traitCollection.horizontalSizeClass == .regular &&
						traitCollection.verticalSizeClass == .regular {
			if UIDevice.current.orientation.isLandscape {
				print("Landscape from willTransition...")
				NSLayoutConstraint.deactivate(iPadLayout)
				NSLayoutConstraint.activate(iPadLandscapeLayout)
			} else {
				print("Portrait")
				NSLayoutConstraint.deactivate(iPadLandscapeLayout)
				NSLayoutConstraint.activate(iPadLayout)
			}
		}
	}
	
	/* This override was added to get the proper display after device rotation */
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		calendarCollectionView.collectionViewLayout.invalidateLayout()
	}
}
