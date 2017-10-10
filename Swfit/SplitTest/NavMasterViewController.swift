//
//  NavMasterViewController.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/8/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

class NavMasterViewController: UINavigationController {
    
    override var description: String {
        return "Navigation Master"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

}

extension NavMasterViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController
        , animationControllerFor operation: UINavigationControllerOperation
        , from fromVC: UIViewController
        , to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let splitVC = navigationController.splitViewController as? SplitViewController else {
            return nil
        }
        //Remove stored value of first detailViewController
        splitVC.firstDetailViewController = nil
        
        if (operation == .pop) {
            
            if (splitVC.traitCollection.horizontalSizeClass == .regular) {
                // Perform a back action on the detail
                if let detailNavController = splitVC.viewControllers.last as? UINavigationController {
                    detailNavController.popViewController(animated: true)
                }
                
            } else {
                // If the SplitViewController is in compact size this master navigation has one ViewController from master and one from detail
                // So this pop action should remove the toVC form the master part
                let index = navigationController.index(OfViewControllerClass: type(of: toVC))
                if (index != NSNotFound && index > 0) {
                    OperationQueue.main.addOperation({ [unowned self] in
                        self.viewControllers.remove(at: index)
                    })
                }
                
                // If the index is 0 means that we're poping to the initial masterViewController so we need to keep a reference to the initial detailViewController
                // We are doin this in order to return from split screen (compact) to regular screen (regular)
                if (index == 0) {
                    splitVC.firstDetailViewController = fromVC;
                }
            }
        }
        
        if (operation == .push
            && splitVC.traitCollection.horizontalSizeClass == .compact
            && navigationController.viewControllers.first != fromVC) {
            
            let count = navigationController.viewControllers.count - 1
            let half = count/2
            if let storyboard = fromVC.storyboard
                , let identifier = fromVC.restorationIdentifier  {
                
                let masterVC = storyboard.instantiateViewController(withIdentifier: identifier)
                OperationQueue.main.addOperation({ [unowned self] in
                    self.viewControllers.insert(masterVC, at: half)
                })
            }
        }
        return nil
    }
    
}
