//
//  ViewController.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/7/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

class Page0ViewController: BaseViewController, Printable {
    
    override var description: String {
        return "Page 0"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.preferredDisplayMode = .allVisible;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func printButtonTapped(_ sender: UIButton) {
        printInformation()
    }
    
}
