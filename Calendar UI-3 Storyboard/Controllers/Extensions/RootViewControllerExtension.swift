//
//  RootViewControllerExtension.swift
//  Calendar UI-3 Storyboard
//
//  Created by Joel Ton on 8/18/19.
//  Copyright © 2019 RAMJETApps. All rights reserved.
//

import UIKit

/* This extension is used to provide a way to vary traits in the layout for the iPad orientations */

extension RootViewController {
	override func overrideTraitCollection(forChild childViewController:
											UIViewController) -> UITraitCollection? {
		if view.bounds.width < view.bounds.height {
			let traitCollections = [UITraitCollection(horizontalSizeClass: .compact),
									UITraitCollection(verticalSizeClass: .regular)]
			return UITraitCollection(traitsFrom: traitCollections)
		} else {
			let traitCollections = [UITraitCollection(horizontalSizeClass: .unspecified),
									UITraitCollection(verticalSizeClass: .unspecified)]
			return UITraitCollection(traitsFrom: traitCollections)
		}
	}
}
