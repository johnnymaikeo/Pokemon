//
//  Sprites.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import Foundation

final class Sprites: ResponseObjectSerializable {
    
    var backFemale:String?
    var backShinyFemale:String?
    var backDefault:String?
    var frontFemale:String?
    var frontShinyFemale:String?
    var backShiny:String?
    var frontDefault:String!
    var frontShiny:String?
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.backFemale = representation.valueForKeyPath("back_female") as? String
        self.backShinyFemale = representation.valueForKeyPath("back_shiny_female") as? String
        self.backDefault = representation.valueForKeyPath("back_default") as? String
        self.frontFemale = representation.valueForKeyPath("front_female") as? String
        self.frontShinyFemale = representation.valueForKeyPath("front_shiny_female") as? String
        self.backShiny = representation.valueForKeyPath("back_shiny") as? String
        self.frontDefault = representation.valueForKeyPath("front_default") as! String
        self.frontShiny = representation.valueForKeyPath("front_shiny") as? String
    }
}