//
//  SettingsClass.swift
//  UserInterfaceExample
//
//  Created by Kevin Leong on 9/14/22.
//  Copyright © 2022 Eric Larson. All rights reserved.
//

import UIKit

class SettingsClass: NSObject {
    
    static let sharedInstance = SettingsClass()
    
    var backgroundColor : UIColor{
        
        get {
            return self.backgroundColor
        }
        
        set (newColor) {
            self.backgroundColor = newColor
            
        }
        
    }
    


}
