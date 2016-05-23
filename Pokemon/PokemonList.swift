//
//  PokemonList.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import Foundation

final class PokemonList: ResponseObjectSerializable {
    
    var count:Int!
    var next:String!
    var results:[Pokemon]!
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.count = representation.valueForKeyPath("count") as! Int
        self.next = representation.valueForKeyPath("next") as! String
        let representation = representation.valueForKeyPath("results") as! [AnyObject]
        self.results = Pokemon.collection(response: response, representation: representation)
    }
    
}