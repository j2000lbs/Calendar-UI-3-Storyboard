//
//  ViewWillTransitionExtension.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/25/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

extension RootViewController {
	
	override func viewWillTransition(to size: CGSize,
									 with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		
		// regular - regular size class is the iPad
		if traitCollection.horizontalSizeClass == .regular &&
			traitCollection.verticalSizeClass == .regular {
			if UIDevice.current.orientation.isLandscape {
				print("Landscape")
				calendarViewTrailingConstraint.constant = 384
				calendarViewBottonConstraint.constant = 38
				
				// need to run the item size code again.
			} else {
				print("Portrait")
				calendarViewTrailingConstraint.constant = 0
				calendarViewBottonConstraint.constant = 0
				
			}
		}
	}
}
