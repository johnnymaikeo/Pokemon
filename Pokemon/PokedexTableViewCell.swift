//
//  PokedexTableViewCell.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import UIKit

class PokedexTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
