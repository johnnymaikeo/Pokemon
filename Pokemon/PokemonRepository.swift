//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import Foundation
import Alamofire

class PokemonRepository {
    
    func list (completion: (pokemons:[Pokemon]) -> ()) {        
        Alamofire.request(.GET, "https://pokeapi.co/api/v2/pokemon/?limit=100")
            .responseObject { (response: Response<PokemonList, NSError>) in
                switch response.result {
                case .Success(let pokemonList):
                    completion(pokemons: pokemonList.results)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    func get (url: String, completion: (pokemon:Pokemon) -> ()) -> Void {
        
        Alamofire.request(.GET, url)
            .responseObject{ (response: Response<Pokemon, NSError>) in
                switch response.result {
                case .Success(let pokemon):
                    completion(pokemon: pokemon)
                case .Failure(let error):
                    print (error)
                }
            }
    
    }
}

