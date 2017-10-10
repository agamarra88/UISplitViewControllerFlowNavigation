//
//  BaseViewController.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/9/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded viewcontroller: \(description)")
        if let _ = self.splitViewController
            , self.navigationController is NavDetailViewController {
            self.navigationItem.hidesBackButton = self.traitCollection.horizontalSizeClass == .regular
        }
    }

}
