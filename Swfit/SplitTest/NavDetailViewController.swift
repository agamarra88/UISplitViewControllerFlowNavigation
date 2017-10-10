//
//  NavDetailViewController.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/8/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

class NavDetailViewController: UINavigationController {
    
    override var description: String {
        return "Navigation Detail"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }
    
}

extension NavDetailViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController
        , animationControllerFor operation: UINavigationControllerOperation
        , from fromVC: UIViewController
        , to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let splitVC = navigationController.splitViewController as? SplitViewController else {
            return nil
        }
        
        //Remove stored value of first detailViewController
        splitVC.firstDetailViewController = nil
  
        if (operation == .push) {
            guard let storyboard = fromVC.storyboard
                , let identifier = fromVC.restorationIdentifier
                , let masterNavController = self.splitViewController?.viewControllers.first as? UINavigationController else {
                    return nil
            }
            let masterNextVC = storyboard.instantiateViewController(withIdentifier: identifier)
            masterNavController.pushViewController(masterNextVC, animated: true)
        }
        
        return nil
    }
    
}
