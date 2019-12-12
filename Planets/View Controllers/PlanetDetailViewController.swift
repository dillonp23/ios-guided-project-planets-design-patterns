//
//  PlanetDetailViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 9/20/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let planet = planet, isViewLoaded else {
            imageView?.image = nil
            label?.text = nil
            return
        }
        
        imageView.image = planet.image
        label.text = planet.name
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        
        do {
            // Object/Struct -> Data
            let planetData = try PropertyListEncoder().encode(planet)
            
            // Passing it along to encoder
            coder.encode(planetData, forKey: "planetData")
            
        } catch {
            fatalError("Could not encode planet")
        }
        
        
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        // Retreieve data
        guard let planetData = coder.decodeObject(forKey: "planetData") as? Data else {
            return
        }
        
        // Data -> Object/Struct
        guard let decodedPlanet = try? PropertyListDecoder().decode(Planet.self, from: planetData) else {
            return
        }
        
        planet = decodedPlanet
        
    }
}
