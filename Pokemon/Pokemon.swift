//
//  Pokemon.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import Foundation
import UIKit

final class Pokemon: ResponseObjectSerializable {
    
    let name: String!
    let url: String!
    let sprites: Sprites!
    var image:UIImage? = nil
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.url = representation.valueForKeyPath("url") as? String
        self.name = representation.valueForKeyPath("name") as? String
        
        if representation.valueForKeyPath("sprites") != nil {
            self.sprites = Sprites(response: response, representation: representation.valueForKeyPath("sprites")!)!
        } else {
            self.sprites = nil
        }
    }
    
    static func collection(response response:NSHTTPURLResponse, representation: AnyObject) -> [Pokemon] {
        var pokemons: [Pokemon] = []
        if let representation = representation as? [[String: AnyObject]] {
            for pokemonRepresentation in representation {
                if let user = Pokemon(response: response, representation: pokemonRepresentation) {
                    pokemons.append(user)
                }
            }
        }
        return pokemons
    }
}