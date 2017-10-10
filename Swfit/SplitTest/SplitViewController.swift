//
//  SplitViewController.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/8/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {

    fileprivate var defaultCollapsing:Bool = true
    var firstDetailViewController:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

}

extension SplitViewController : UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController
        , collapseSecondary secondaryViewController: UIViewController
        , onto primaryViewController: UIViewController) -> Bool {
        
        guard let masterNavController = primaryViewController as? UINavigationController
            , let detailNavController = secondaryViewController as? UINavigationController else {
                defaultCollapsing = true
                return false
        }
        defaultCollapsing = false
        
        // Enable back button
        for vc in detailNavController.viewControllers {
            vc.navigationItem.hidesBackButton = false
        }
        
        // Copy elements to master
        masterNavController.viewControllers.append(contentsOf: detailNavController.viewControllers)
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController
        , separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        
        guard let masterNavController = primaryViewController as? UINavigationController
            , !defaultCollapsing else {
                return nil
        }
        
        var controllers = masterNavController.viewControllers
        if (controllers.count == 1 && self.firstDetailViewController != nil) {
            controllers.append(self.firstDetailViewController!)
        }
        
        let count = controllers.count
        let half = count/2
        let masterViewControllers = controllers[0 ..< half]
        let detailViewControllers = controllers[half ..< count]
        
        masterNavController.viewControllers = Array(masterViewControllers)
        
        let detailNavController = NavDetailViewController()
        detailNavController.viewControllers = Array(detailViewControllers)
        for vc in detailNavController.viewControllers {
            vc.navigationItem.hidesBackButton = true
        }
    
        //clear stored value
        firstDetailViewController = nil
        return detailNavController
    }
}
