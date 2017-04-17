//
//  FinalViewController.swift
//  app
//
//  Created by Damir Garifullin on 17/04/2017.
//  Copyright © 2017 Damir Garifullin. All rights reserved.
//

import Foundation
import UIKit

class FinalViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        performSegue(withIdentifier: "goToRoot", sender: self)
    }
}
