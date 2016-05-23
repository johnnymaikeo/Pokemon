//
//  ListTableViewController.swift
//  Pokemon
//
//  Created by Johnny on 5/21/16.
//  Copyright © 2016 PosUp. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var pokemons:[Pokemon] = []
    var repository:PokemonRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repository = PokemonRepository()
        repository.list() {
            list in
            self.pokemons = list
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func updatePokemonFromDetails(pokemon: Pokemon, index:Int) {
        pokemons[index] = pokemon
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row];
        
        let cell:PokedexTableViewCell = tableView.dequeueReusableCellWithIdentifier("PokemonListCell", forIndexPath: indexPath) as! PokedexTableViewCell
        
        cell.pokemonName.text = pokemon.name
        
        if pokemon.image != nil {
            cell.pokemonImage.image = pokemon.image
        } else {
            cell.pokemonImage.image = UIImage()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let pokemon:Pokemon = self.pokemons[indexPath.row]
        
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let details:DetailsTableViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("DetailsTableViewController") as! DetailsTableViewController
        
        details.pokemon = pokemon
        details.pokemonIndex = indexPath.row
        details.delegate = self
        
        if let navigation = self.navigationController {
            navigation.pushViewController(details, animated: true)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
