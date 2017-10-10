//
//  Page3ViewController.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/7/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

class Page3ViewController: BaseViewController, Printable {

    @IBOutlet weak var navigationLabel: UILabel!
    
    override var description: String {
        return "Page 4"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationLabel.text = self.navigationController?.description
    }

    @IBAction func printButtonTapped(_ sender: UIButton) {
        printInformation()
    }
}
