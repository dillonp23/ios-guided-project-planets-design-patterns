//
//  Planet.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

// Class:
// pointer-based = references -> Holding a dog(class) by a leash(reference), anyone can come over, unleash your dog and change it for another dog


// Struct:
//value based = literally holding a dog in your arms, when you need to do something to it, you have to let it go and then get changed back
// Models should almost always be struct based


///both can implement protocols


// if no reason to change the properties, then should be setting them as constants.. easy weay to make sure that structs dont change from underneath you
struct Planet: Codable {
    let name: String
    let imageName: String
    
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }    
}


extension Planet {
    
    var image: UIImage {
        return UIImage(named: imageName)!
    }
    
}
