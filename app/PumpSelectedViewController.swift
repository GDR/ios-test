//
//  PumpSelectedViewController.swift
//  app
//
//  Created by Damir Garifullin on 14/04/2017.
//  Copyright © 2017 Damir Garifullin. All rights reserved.
//

import UIKit

class PumpSelectedViewController: UIViewController {
    
    @IBOutlet var pumps: [UIPumpButton]!
    @IBOutlet var fuels: [UIButton]!
    @IBOutlet weak var fuelButtonsWrapper: UIStackView!
    
    
    var currentPump: UIPumpButton? = nil
    
    
    override func viewDidLoad() {
        pumps.sort { (left, right) -> Bool in
            return left.pumpId < right.pumpId
        }
        for pump in pumps {
            print(pump.pumpId)
            pump.addTarget(self, action: #selector(onPumpTap(sender:)), for: .touchUpInside)
        }
    }
    
    func onPumpTap(sender: UIPumpButton!) {
        if (currentPump != sender) {
            print("yay \(sender.pumpId)")
            currentPump?.isSelected = false
            currentPump = sender
            currentPump?.isSelected = true
        }
        self.fuelButtonsWrapper.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.fuelButtonsWrapper.alpha = 1
        }
    }
}

class UIPumpButton: UIButton {
    public var pumpId: Int = 0
}
