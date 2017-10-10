//
//  UINavigationController+Help.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/8/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func index(OfViewControllerClass controllerClass:AnyClass) -> Int {
        for i in 0..<viewControllers.count {
            if (viewControllers[i].isKind(of: controllerClass)) {
                return i
            }
        }
        return NSNotFound
    }

}
