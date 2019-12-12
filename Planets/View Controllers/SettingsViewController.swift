//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var shouldShowPlutoSwitch: UISwitch!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    private func updateViews() {
//        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = UserDefaults.standard.bool(forKey: .shouldShowPlutoKey)
        
    }
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        
        
        // notifications are event-based triggers (one to many calls)
        // The toggle was just switched
        
        // save to user defaults
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
        // notify everyone (interested) that we should change plutos status as a planet
        // 1. NotificationCenter is creating a NotificationObject with the given name
        // 2. (Optional) NC is attaching an object to NotificationObject
        NotificationCenter.default.post(name: .plutoPlanetStatusChanged, object: nil)
    }
}
