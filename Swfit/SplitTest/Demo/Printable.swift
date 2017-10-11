//
//  Printable.swift
//  SplitTest
//
//  Created by Arturo Gamarra on 10/8/17.
//  Copyright © 2017 Abstract. All rights reserved.
//

import UIKit

protocol Printable {
    
    func printInformation()
    
}

extension Printable where Self: UIViewController {
    
    func printInformation() {
        print("\(self.description) - navigation: \(self.navigationController!.description)")
        print("Elementos del navigation")
        for vc in self.navigationController!.viewControllers {
             print("\t- \(vc.description)")
        }
    }
    
}
