//
//  PopUpModalViewController.swift
//  UserInterfaceExample
//
//  Created by Wyatt Saltzman on 9/14/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

import UIKit

class PopUpModalViewController: UIViewController {
    var count = 11
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if count > 0 {
            print("\(count) seconds until the explosion")
            count -= 1
            countDownLabel.text = String(count)
            }
        else{
            timer?.invalidate()
        }
    }
    
    @IBOutlet weak var theImage: UIImageView!
    
    @IBAction func returnToRootVC(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBOutlet weak var countDownLabel: UILabel!
}
