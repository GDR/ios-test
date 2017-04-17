//
//  FuelPaymentViewController.swift
//  app
//
//  Created by Damir Garifullin on 17/04/2017.
//  Copyright © 2017 Damir Garifullin. All rights reserved.
//

import Foundation
import UIKit

class FuelPaymentViewController: UIViewController {
    
    @IBOutlet weak var litersField: UITextField!
    @IBOutlet weak var rublesField: UITextField!
    @IBOutlet weak var payButton: UIButton!
    
    @IBAction func payButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "openFinal", sender: self)
    }
    
    var price: Double = 1
    
    override func viewDidLoad() {
        litersField.addTarget(self, action: #selector(litersChanged), for: UIControlEvents.editingChanged)
        rublesField.addTarget(self, action: #selector(rublesChanged), for: UIControlEvents.editingChanged)
    }
    
    func litersChanged() {
        if let litersValue = Double.init(litersField.text!) {
            self.rublesField.text = String.init(format: "%.2f", litersValue * 37.7)
            payButton.isEnabled = true
        } else {
            self.rublesField.text = ""
            payButton.isEnabled = false
        }
    }
    
    func rublesChanged() {
        if let rublesValue = Double.init(rublesField.text!) {
            self.litersField.text = String.init(format: "%.2f", rublesValue * 37.7)
            payButton.isEnabled = true
        } else {
            self.litersField.text = ""
            payButton.isEnabled = false
        }
    }
}
