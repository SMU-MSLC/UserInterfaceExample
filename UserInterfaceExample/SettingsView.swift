//
//  SettingsView.swift
//  UserInterfaceExample
//
//  Created by Caleb Moore on 9/13/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {

    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var SliderLabel: UILabel!
    @IBOutlet weak var StepperLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SliderLabel.text = "Background Darkness"
        StepperLabel.text = "Displayed Images"
        Slider.maximumValue = 256
        
    }
    @IBAction func SliderAction(_ sender: UISlider) {
        SliderLabel.text = String(Slider.value)
        sender.setValue(round(sender.value), animated:true)
    }
    
    
    @IBAction func StepperAction(_ sender: Any) {
        StepperLabel.text = String(Stepper.value)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
