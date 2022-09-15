//
//  SettingsView.swift
//  UserInterfaceExample
//
//  Created by Caleb Moore on 9/13/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

import UIKit

class SettingsView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let settings = SettingsClass.sharedInstance
    
    let pickerData = ["Default","Red", "Green", "Blue", "Magenta"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            self.view.backgroundColor = UIColor.systemBackground
            settings.backgroundColor = UIColor.systemBackground
        case 1:
            self.view.backgroundColor = UIColor.red
            settings.backgroundColor = UIColor.red
        case 2:
            self.view.backgroundColor = UIColor.green
        case 3:
            self.view.backgroundColor = UIColor.blue
        case 4:
            self.view.backgroundColor = UIColor.magenta
        default:
            self.view.backgroundColor = UIColor.white
        }
        
    }

    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var PickerButton: UIButton!
    
    @IBOutlet weak var SliderLabel: UILabel!
    @IBOutlet weak var StepperLabel: UILabel!
    @IBOutlet weak var SwitchLabel: UILabel!
    
    @IBOutlet weak var Picker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SwitchLabel.text = "Dark Mode"
        if(UIApplication.shared.keyWindow?.overrideUserInterfaceStyle == .dark){
            Switch.setOn(true, animated: true)
        } else {
            Switch.setOn(false, animated: true)
        }
        
        
        SliderLabel.text = "Background Darkness"
        Slider.maximumValue = 256
        
        StepperLabel.text = "Displayed Images"
        
        PickerButton.setTitle("Set Settings Background Color", for: .normal)
        Picker.dataSource = self
        Picker.delegate = self
        Picker.isHidden = true
        
    }
    @IBAction func SliderAction(_ sender: UISlider) {
        SliderLabel.text = String(Slider.value)
        sender.setValue(round(sender.value), animated:true)
    }
    
    
    @IBAction func StepperAction(_ sender: Any) {
        StepperLabel.text = String(Stepper.value)
    }
    
    @IBAction func SwitchAction(_ sender: Any) {
        if(Switch.isOn){
            let window = UIApplication.shared.keyWindow
                    window?.overrideUserInterfaceStyle = .dark
        } else {
            let window = UIApplication.shared.keyWindow
                    window?.overrideUserInterfaceStyle = .light
        }
    }

    
    @IBAction func PickerButtonPress(_ sender: Any) {
        Picker.isHidden = !Picker.isHidden
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
