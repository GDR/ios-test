//
//  AccountViewController.swift
//  app
//
//  Created by Damir Garifullin on 17/04/2017.
//  Copyright © 2017 Damir Garifullin. All rights reserved.
//

import Foundation
import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        
        navigationBar.titleView = UIImageView(image: #imageLiteral(resourceName: "logo"))
    }
}
